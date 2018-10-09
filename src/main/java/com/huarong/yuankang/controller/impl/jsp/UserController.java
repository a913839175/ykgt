package com.huarong.yuankang.controller.impl.jsp;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;
import com.huarong.framework.util.CustomSystemUtil;
import com.huarong.framework.util.DesUtil;
import com.huarong.framework.util.HttpUtil;
import com.huarong.yuankang.controller.BaseController;

//用户操作
@Controller
@EnableAutoConfiguration
@RequestMapping("/user")
public class UserController extends BaseController{

	//登录页
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginPage(HttpServletRequest request){
		String isLogin = getField(request,"userinfo","user_name");
		if(isLogin == null ||isLogin.isEmpty()) {	
			setRequestAttribute(request,"title", "登录-");
			setRequestAttribute(request,"type", "login");
			String str = new Date().getTime()+"weipaidai|||";		
			String desStr = DesUtil.encrypt(str);
			setRequestSessionAttribute(request,"desStr", desStr);
			return "/user/user_login";
		}else {
			return "redirect:/index";
		}
	}
	//注册页
	@RequestMapping(value="/reg",method=RequestMethod.GET)
	public String regPagea(HttpServletRequest request){
		setRequestAttribute(request,"title", "注册-");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String timestr = df.format(new Date());
		String str = "weipaidai|||"+timestr;		
		String desStr = DesUtil.encrypt(str);
		String ip = CustomSystemUtil.getIpAddr(request);
		setRequestSessionAttribute(request,"desStr", desStr);
		setRequestSessionAttribute(request,"ip", ip);
		return "/user/user_reg";
	}
	@RequestMapping(value="/reg/{type}",method=RequestMethod.GET)
	public String regPage(HttpServletRequest request,@PathVariable String type){
		setRequestAttribute(request,"title", "注册-");
		String realname_flag = getField(request,"userinfo","realname_flag");
		if(realname_flag == null || realname_flag.isEmpty() || realname_flag.equals("1")) {		
			return "redirect:/index";
		}else {		
			JSONObject areaList = getJson(HttpUtil.getWebServer("/wpd/index/get_fy_area_list"));
			setRequestAttribute(request,"areaList", areaList);
			//System.out.println(areaList);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String timestr = df.format(new Date());
			String str = "weipaidai|||"+timestr;		
			String desStr = DesUtil.encrypt(str);
			setRequestAttribute(request,"type", type);
			setRequestAttribute(request,"desStr", desStr);
			return "/user/user_reg";
		}	
	}
	//忘记密码
	@RequestMapping(value = "/findPwd",method=RequestMethod.GET)
    public String forgetpassword(HttpServletRequest request,String type) {		
		setRequestAttribute(request,"type", type);
		setRequestAttribute(request,"title", "忘记密码|");
		return "/user/user_findpwd";
    }
    //充值
    @RequestMapping(value = "/recharge",method=RequestMethod.GET)
    public String recharge(HttpServletRequest request) {
    	setRequestAttribute(request,"type", "recharge");
    	setRequestAttribute(request,"title", "充值-");
		String isLogin = getField(request,"userinfo","user_name");
		String depository_flag = getField(request,"userinfo","depository_flag");
		String bank_flag = getField(request,"userinfo","bank_flag");
		if(isLogin == null ||isLogin.isEmpty()) {	
			return "redirect:/user/login?redirectURL=/user/recharge";
		}else {
			if(depository_flag.equals("1") && bank_flag.equals("1")) {
				return "/user/user_recharge";
			}else {
				return "redirect:/user/account";
			}		
		}
	}
     //提现
    @RequestMapping(value = "/kiting",method=RequestMethod.GET)
    public String kiting(HttpServletRequest request) {
    	setRequestAttribute(request,"type", "kiting");
    	setRequestAttribute(request,"title", "提现-");
    	String isLogin = getField(request,"userinfo","user_name");
    	String depository_flag = getField(request,"userinfo","depository_flag");
		String bank_flag = getField(request,"userinfo","bank_flag");
		if(isLogin == null ||isLogin.isEmpty()) {	
			return "redirect:/user/login?redirectURL=/user/kiting";
		}else {
			if(depository_flag.equals("1") && bank_flag.equals("1")) {
				return "/user/user_kiting";	
			}else {
				return "redirect:/user/account";
			}				
		}
	}
}


