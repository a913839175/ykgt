package com.huarong.yuankang.controller.impl.rest;



import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.huarong.framework.util.CustomSystemUtil;
import com.huarong.framework.util.DesUtil;
import com.huarong.framework.util.HttpUtil;
import com.huarong.framework.util.QRCodeUtil;
import com.huarong.yuankang.controller.BaseController;

@RestController
@EnableAutoConfiguration
public class RestjsonController  extends BaseController{ 
	@RequestMapping("/api/getIp")  
	public String getIp(HttpServletRequest request) {
		String ip = CustomSystemUtil.getInternetIp();
		return ip;  
    }

	@RequestMapping("/api/json/getInfoJson") 
	public void getInfo(HttpServletRequest request, HttpServletResponse response) {
	    response.setContentType("text/json; charset=UTF-8");
	    JSONObject jsonObj = new JSONObject();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHH");
		/*获取用户信息*/
		String user_id = getRequestSessionAttribute(request, "user_id");
		String us_token = getRequestSessionAttribute(request, "us_token");
		String version = df.format(new Date());
		
		JSONObject userinfo = postJson(HttpUtil.getWebServer("/wpd/user_query/user_info?user_id="+user_id+"&us_token="+us_token),"");
			jsonObj.put("bank_flag", userinfo.getString("bank_flag"));
			jsonObj.put("birthday", userinfo.getString("birthday"));
			jsonObj.put("depository_flag", userinfo.getString("depository_flag"));
			jsonObj.put("last_login_time", userinfo.getString("last_login_time"));
			jsonObj.put("pay_flag", userinfo.getString("pay_flag"));
			jsonObj.put("phone_flag", userinfo.getString("phone_flag"));
			jsonObj.put("realname_flag", userinfo.getString("realname_flag"));
			jsonObj.put("sex", userinfo.getString("sex"));
			jsonObj.put("us_token_msg", userinfo.getString("us_token_msg"));
			jsonObj.put("user_name", userinfo.getString("user_name"));
			jsonObj.put("user_type", userinfo.getString("user_type"));
			jsonObj.put("user_id", user_id);
			jsonObj.put("us_token", us_token);
			jsonObj.put("version", version);
	    try {  
	        response.getWriter().write("var webAppInfo = "+jsonObj);
	        response.getWriter().flush();
	        response.getWriter().close();
	    } catch (IOException e) {  
	        e.printStackTrace();  
	    }  
	}
	/*用户登录信息*/
	@RequestMapping(value = "/api/login", method = {RequestMethod.POST})  
	public JSONObject login(HttpServletRequest request,String CSRFTOKEN,String subtime) {
		JSONObject Logins = postJson(HttpUtil.getWebServer("/wpd/user_query/userVerify?userVerify="+CSRFTOKEN+"&unixkey="+subtime),"");
		
		String user_id = (String) Logins.get("user_id");
		String us_token = (String) Logins.get("us_token");
		
		JSONObject userinfo = postJson(HttpUtil.getWebServer("/wpd/user_query/user_info?user_id="+user_id+"&us_token="+us_token),"");
		setRequestSessionAttribute(request,"userinfo", userinfo);  	
		setRequestSessionAttribute(request,"user_id",user_id);
		setRequestSessionAttribute(request,"us_token",us_token);

		return Logins;
    }
	//
	@RequestMapping(value = "/api/checkUsername", method = {RequestMethod.POST})  
	public JSONObject checkUsername(HttpServletRequest request,String username,String user_type) {
		JSONObject checkUsername = postJson(HttpUtil.getWebServer("/wpd/user/checkUsername?username="+username+"&user_type="+user_type),"");
        return checkUsername;
    }
	/*用户注册*/
	@RequestMapping(value = "/api/reg", method = {RequestMethod.POST})  
	public JSONObject reg(HttpServletRequest request,String CSRFTOKEN,String subtime) {
		JSONObject reg = postJson(HttpUtil.getRedisJob("/reg/userDesReg?userVerify="+CSRFTOKEN+"&unixkey="+subtime),"");
        return reg;
    }
	/*用户实名*/
	@RequestMapping(value = "/api/realNameReg", method = {RequestMethod.POST})  
	public JSONObject realNameReg(HttpServletRequest request,String CSRFTOKEN,String subtime) {
		JSONObject realNameReg = postJson(HttpUtil.getRedisJob("/reg/userDesRealNameReg?userVerify="+CSRFTOKEN+"&unixkey="+subtime),"");
		return realNameReg;
    }
	@RequestMapping(value = "/api/getDesStr", method = {RequestMethod.POST})  
	public JSONObject getDesStr(String str) {
		JSONObject jsonObj = new JSONObject();
		String desStr = DesUtil.encrypt(str);
		jsonObj.put("result", desStr);
		return jsonObj;  
    }
	/*获取用户实名信息*/
	@RequestMapping(value = "/api/getUsRealnameInfo", method = {RequestMethod.POST})  
	public JSONObject getUsRealnameInfo(HttpServletRequest request,String uuid) {
		String user_id = getRequestSessionAttribute(request, "user_id");
		JSONObject getUsRealnameInfo = postJson(HttpUtil.getWebServer("/wpd/user_query/get_user_realname_info?des_day="+uuid+"&user_id="+user_id),"");
		return getUsRealnameInfo; 
    }
	@RequestMapping(value = "/api/getUserInfo", method = {RequestMethod.POST})  
	public JSONObject getUserInfo(HttpServletRequest request) {
		JSONObject jsonObj = new JSONObject();
		/*获取用户信息*/
		String user_id = getRequestSessionAttribute(request, "user_id");
		String us_token = getRequestSessionAttribute(request, "us_token");
		
		JSONObject userinfo = postJson(HttpUtil.getWebServer("/wpd/user_query/user_info?user_id="+user_id+"&us_token="+us_token),"");
		if(userinfo!=null) {
			jsonObj.put("bank_flag", userinfo.getString("bank_flag"));
			jsonObj.put("birthday", userinfo.getString("birthday"));
			jsonObj.put("depository_flag", userinfo.getString("depository_flag"));
			jsonObj.put("last_login_time", userinfo.getString("last_login_time"));
			jsonObj.put("pay_flag", userinfo.getString("pay_flag"));
			jsonObj.put("phone_flag", userinfo.getString("phone_flag"));
			jsonObj.put("realname_flag", userinfo.getString("realname_flag"));
			jsonObj.put("sex", userinfo.getString("sex"));
			jsonObj.put("us_token_msg", userinfo.getString("us_token_msg"));
			jsonObj.put("user_name", userinfo.getString("user_name"));
			jsonObj.put("user_type", userinfo.getString("user_type"));
			jsonObj.put("user_id", user_id);
			jsonObj.put("us_token", us_token);
		}	
		setRequestSessionAttribute(request,"userinfo", userinfo);
        return jsonObj;  
    }
	@RequestMapping(value ="/api/logout", method = {RequestMethod.POST})  
	public JSONObject logout(HttpServletRequest request) {
		String user_id = getRequestSessionAttribute(request, "user_id");
		String us_token = getRequestSessionAttribute(request, "us_token");	
		JSONObject logoutObj = postJson(HttpUtil.getWebServer("/wpd/user_query/login_out?user_id="+user_id+"&us_token="+us_token),"");	
		logoutObj.put("result", true);
		logoutObj.put("errorMsgInfo", "成功退出登录");
		request.getSession().invalidate();
        return logoutObj;  
    }
	//获取邀请验证码
	@RequestMapping(value="/api/getQrCodeUrl")
	public JSONObject getQrCodeUrl(HttpServletRequest request,String user_id,String url){
		JSONObject jsonObj = new JSONObject();
		String urlr = QRCodeUtil.getQrCodeFile(user_id, url,request);
		jsonObj.put("url", urlr);
		return  jsonObj;
	}
} 