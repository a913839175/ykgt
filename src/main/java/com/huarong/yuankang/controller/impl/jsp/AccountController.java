package com.huarong.yuankang.controller.impl.jsp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;
import com.huarong.framework.util.CustomSystemUtil;
import com.huarong.framework.util.DesUtil;
import com.huarong.framework.util.HttpUtil;
import com.huarong.framework.util.QRCodeUtil;
import com.huarong.yuankang.controller.BaseController;


//我的账户--投资账户
@Controller
@EnableAutoConfiguration
public class AccountController extends BaseController{

	//我的投资
	@RequestMapping(value="/user/myinvest",method=RequestMethod.GET)
	public String myinvest(HttpServletRequest request){
		setRequestAttribute(request,"type", "myinvest");
		String isLogin = getField(request,"userinfo","user_name");
		if(isLogin == null ||isLogin.isEmpty()) {	
			return "redirect:/user/login?redirectURL=/user/myinvest";
		}else {
			return "/user/user_myinvest";
		}	
	}
	//历史回款
	@RequestMapping(value="/user/claim",method=RequestMethod.GET)
	public String claim(HttpServletRequest request){
		setRequestAttribute(request,"type", "claim");
		String isLogin = getField(request,"userinfo","user_name");
		if(isLogin == null ||isLogin.isEmpty()) {	
			return "redirect:/user/login?redirectURL=/user/claim";
		}else {
			String user_id = getRequestSessionAttribute(request, "user_id");
			String us_token = getRequestSessionAttribute(request, "us_token");
			String ip = CustomSystemUtil.getIpAddr(request);
			JSONObject old_account = postJson(HttpUtil.getWebServer("/wpd/user_query/get_old_account?user_id="+user_id+"&us_token="+us_token),"");
			setRequestSessionAttribute(request,"old_account", old_account);
			setRequestSessionAttribute(request,"ip", ip);
			return "/user/user_claim";
		}		
	}
	//会员中心
	@RequestMapping(value = "/user/vip",method=RequestMethod.GET)
    public String user_vip(HttpServletRequest request,String type) {		
		setRequestAttribute(request,"type", "vip");
		String isLogin = getField(request,"userinfo","user_name");
		if(isLogin == null ||isLogin.isEmpty()) {	
			return "redirect:/user/login?redirectURL=/user/vip";
		}else {
			return "/user/user_vip";
		}
    }
	//邀请好友
	@RequestMapping(value = "/user/invite",method=RequestMethod.GET)
    public String invite(HttpServletRequest request) {
		int port = request.getServerPort();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+port;
		if(port == 80) {
			basePath = request.getScheme()+"://"+request.getServerName();
		}           
        String isLogin = getField(request,"userinfo","user_name");
		setRequestAttribute(request,"type", "invite");	
		if(isLogin == null ||isLogin.isEmpty()) {	
			return "redirect:/user/login?redirectURL=/user/invite";
		}else {
			String code = DesUtil.encrypt(isLogin);
		    String user_id = getRequestSessionAttribute(request, "user_id");
			String inviteUrl = basePath+"/user/reginvite?code=" + code;
			String ORcodeUrl = QRCodeUtil.getQrCodeFile(user_id, inviteUrl,request);
			//System.err.println(port);
			setRequestAttribute(request,"inviteUrl", inviteUrl);
			setRequestAttribute(request,"ORcodeUrl", ORcodeUrl);
			return "/user/user_invite";
		}	
    }
	//分享好友链接
	@RequestMapping(value = "/user/reginvite",method=RequestMethod.GET)
    public String share(HttpServletRequest request,String code) {
		String phone = DesUtil.decrypt(code);
		setRequestSessionAttribute(request,"phone", phone);
		return "redirect:/user/reg";	
    }
	//安全中心
	@RequestMapping(value = "/user/safety",method=RequestMethod.GET)
    public String safety(HttpServletRequest request,String bizType) {		
		setRequestAttribute(request,"type", "safety");
		String isLogin = getField(request,"userinfo","user_name");
		String user_type = getField(request,"userinfo","user_type");
		String user_id = getRequestSessionAttribute(request, "user_id");
		String us_token = getRequestSessionAttribute(request, "us_token");
		if(isLogin == null ||isLogin.isEmpty()) {	
			return "redirect:/user/login?redirectURL=/user/safety";
		}else {
			if(user_id !=null && us_token != null) {
				if(bizType!= null) {
					JSONObject bscgresult = getJson(HttpUtil.getWebServer("/wpd/user_query/get_biz_status?user_id="+user_id+"&us_token="+us_token+"&bizType="+bizType));
					setRequestSessionAttribute(request,"bscgresult", bscgresult);
				}
				JSONObject userinfo = getJson(HttpUtil.getWebServer("/wpd/user_query/user_info?user_id="+user_id+"&us_token="+us_token));
				setRequestSessionAttribute(request,"userinfo", userinfo);
			}
			if(user_type!=null && user_type.equals("02")) {
				//安全中心---借款账户
				return "/borrower/borrower_safety";
			}else {
				//安全中心---投资账户
				return "/user/user_safety";
			}
		}	
    }
    //查看银行卡
	@RequestMapping(value = "/user/checkbank",method=RequestMethod.GET)
	public String checkbank(HttpServletRequest request) {
		String isLogin = getField(request,"userinfo","user_name");
		if(isLogin == null ||isLogin.isEmpty()) {	
			return "redirect:/user/login?redirectURL=/user/checkbank";
		}else {
			return "/user/user_checkbank";
		}	
	}	
	//红包
	@RequestMapping(value = "/user/hongbao",method=RequestMethod.GET)
    public String unusehongbao(HttpServletRequest request) {
		setRequestAttribute(request,"type", "hongbao");
		String isLogin = getField(request,"userinfo","user_name");
		if(isLogin == null ||isLogin.isEmpty()) {	
			return "redirect:/user/login?redirectURL=/user/hongbao";
		}else {
			return "/user/user_hongbao";
		}	
    }
	//消息管理
	@RequestMapping(value = "/user/message",method=RequestMethod.GET)
    public String message(HttpServletRequest request) {		
		setRequestAttribute(request,"type", "message");
		String isLogin = getField(request,"userinfo","user_name");
		String user_id = getRequestSessionAttribute(request, "user_id");
		String us_token = getRequestSessionAttribute(request, "us_token");
		if(isLogin == null ||isLogin.isEmpty()) {	
			return "redirect:/user/login?redirectURL=/user/message";
		}else {
			JSONObject noreadList = getJson(HttpUtil.getWebServer("/wpd/user_query/get_noread_message_count?user_id="+user_id+"&us_token="+us_token)); 			 
        	setRequestSessionAttribute(request,"noreadList", noreadList);
			return "/user/user_message";
		}	
    }
}
