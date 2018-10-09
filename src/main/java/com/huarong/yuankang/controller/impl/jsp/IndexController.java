package com.huarong.yuankang.controller.impl.jsp;


import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;
import com.huarong.framework.util.HttpUtil;
import com.huarong.yuankang.controller.BaseController;

//首页
@Controller
@EnableAutoConfiguration 
public class IndexController  extends BaseController{
	@RequestMapping("/")
    public String reindex() {
        return "forward:/index";
    }
	@RequestMapping(value = "/index", method = {RequestMethod.GET,RequestMethod.POST})
    public String index(HttpServletRequest request) {
        try{
        	setRequestAttribute(request,"type", "index");
			/*获取首页轮播*/
        	JSONObject scrollpic = getJson(HttpUtil.getWebServer("/wpd/index/scrollpic/GetList"));	
        	//System.out.println(scrollpic);
        	setRequestAttribute(request,"scrollpic", scrollpic);
        	      			
			/*获取获取公司统计数据*/
        	JSONObject  gettotaldata = getJson(HttpUtil.getWebServer("/wpd/index/get_total_data"));			
        	setRequestAttribute(request,"gettotaldata", gettotaldata);
			
			/*获取推荐投资产品列表*/
        	JSONObject productRecommend = getJson(HttpUtil.getWebServer("/wpd/index/borrow/product_recommend_List"));
			//System.out.println("推荐投资产品数据:" + productRecommend);  			
        	setRequestAttribute(request,"productRecommend", productRecommend);
			
			/*获取微年利投资产品列表*/
			JSONObject  productwnl = getJson(HttpUtil.getWebServer("/wpd/index/borrow/product_default_List"));
			//System.out.println("获取微年利投资产品列表:" + productwnl);  
			setRequestAttribute(request,"productwnl", productwnl);
			
			/*获取微+系列投资产品列表*/
			JSONObject  product_default_ww_List = getJson(HttpUtil.getWebServer("/wpd/index/borrow/product_default_ww_List"));
			//System.out.println("获取微+系列投资产品列表:" + product_default_ww_List);  
			setRequestAttribute(request,"product_default_ww_List", product_default_ww_List);
							
			/*获取微月盈*/
        	JSONObject monthList = getJson(HttpUtil.getWebServer("/wpd/index/borrow/product_month_List"));
        	//System.out.println("微月盈数据:" + monthList);  			
        	setRequestAttribute(request,"monthList", monthList);
	
			/*获取最新动态*/
        	JSONObject dynamic = getJson(HttpUtil.getWebServer("/wpd/index/get_last_dynamic"));
			//System.out.println("最新动态数据:" + dynamic);  			
        	setRequestAttribute(request,"dynamic", dynamic);
			
			/*获取最新公告*/
			JSONObject notice = getJson(HttpUtil.getWebServer("/wpd/index/get_last_notice"));
			//System.out.println("最新公告:" + notice);  			
			setRequestAttribute(request,"notice", notice);
						
			String user_id = getRequestSessionAttribute(request, "user_id");
			String us_token = getRequestSessionAttribute(request, "us_token");
			if(user_id !=null && us_token != null) {
				JSONObject usermain = getJson(HttpUtil.getWebServer("/wpd/user_query/user_main?user_id="+user_id+"&us_token="+us_token));
				setRequestSessionAttribute(request,"usermain", usermain);
			}					
		}
		catch(Exception ex){
			ex.printStackTrace();
		} 	
		return "/index/index";
    }
	//我要投资
	@RequestMapping(value = "/invest")
    public String invest(HttpServletRequest request) {
		setRequestAttribute(request,"title", "我要投资| ");
		setRequestAttribute(request,"type", "all");
		return "/index/invest";
    }
	//我要借款
	@RequestMapping(value = "/borrow")
    public String borrow(HttpServletRequest request) {
		setRequestAttribute(request,"title", "我要借款| ");
		setRequestAttribute(request,"type", "borrow");
		return "/index/borrow";
    }
	//帮助页面
	@RequestMapping(value="/help/{type}")
	public String help(HttpServletRequest request,@PathVariable String type){
		setRequestAttribute(request,"type", type);
		return "/index/help";
	}
	//信息披露
	@RequestMapping(value = "/report")
    public String disclosure(HttpServletRequest request) {
		setRequestAttribute(request,"title", "信息披露| ");
		setRequestAttribute(request,"type", "report");
		return "/info/info_report";
    }
	//我的账户
	@RequestMapping(value = "/user/account")
    public String account(HttpServletRequest request,String order_pay_msg) {
		setRequestAttribute(request,"title", "我的账户| ");
		setRequestAttribute(request,"type", "account");
		setRequestAttribute(request,"order_pay_msg", order_pay_msg);
		String isLogin = getField(request,"userinfo","user_name");
		String user_type = getField(request,"userinfo","user_type");
		String user_id = getRequestSessionAttribute(request, "user_id");
		String us_token = getRequestSessionAttribute(request, "us_token");	
		if(isLogin == null ||isLogin.isEmpty()) {	
			return "redirect:/user/login?redirectURL=/user/account";
		}else {	
			if(user_id !=null && us_token != null) {	
				
				JSONObject userinfo = getJson(HttpUtil.getWebServer("/wpd/user_query/user_info?user_id="+user_id+"&us_token="+us_token));
				setRequestSessionAttribute(request,"userinfo", userinfo);
				
				JSONObject usermain = postJson(HttpUtil.getWebServer("/wpd/user_query/user_main?user_id="+user_id+"&us_token="+us_token),"");
				setRequestSessionAttribute(request,"usermain", usermain);
				
	        	JSONObject noreadList = getJson(HttpUtil.getWebServer("/wpd/user_query/get_noread_message_count?user_id="+user_id+"&us_token="+us_token)); 			 
	        	setRequestSessionAttribute(request,"noreadList", noreadList);
			}
			if(user_type!=null && user_type.equals("02")) {
				//我的账户---借款账户
				return "/borrower/borrower_account";
			}else {
				//我的账户---投资账户
				return "/user/user_account";
			}		
		}					
    }
	@RequestMapping(value = "/openUrl")
    public String openUrl(HttpServletRequest request,String url) {
		setRequestAttribute(request,"url", url);
		return "/common/openUrl";
    }
	@RequestMapping(value = "/bscg/openAccount")
    public String openAccount(HttpServletRequest request) {
		String isLogin = getField(request,"userinfo","user_name");
		if(isLogin == null ||isLogin.isEmpty()) {	
			return "redirect:/user/login";
		}else {
			return "/jump/openAccount";
		}	
    }
	@RequestMapping(value = "/bscg/tradersPwd")
    public String tradersPwd(HttpServletRequest request) {
		String isLogin = getField(request,"userinfo","user_name");
		if(isLogin == null ||isLogin.isEmpty()) {	
			return "redirect:/user/login";
		}else {
			return "/jump/tradersPwd";
		}
    }
	@RequestMapping(value = "/pay/openRecharge", method = {RequestMethod.POST})
    public String payResult(HttpServletRequest request,String frontRetUrl,String bankCode,String transAmt,String pay_type,String pay_pwd) {
		String isLogin = getField(request,"userinfo","user_name");
		setRequestAttribute(request,"frontRetUrl", frontRetUrl);
		setRequestAttribute(request,"pay_type", pay_type);
		setRequestAttribute(request,"bankCode", bankCode);	
		setRequestAttribute(request,"pay_pwd", pay_pwd);
		setRequestAttribute(request,"transAmt", transAmt);	
		if(isLogin == null ||isLogin.isEmpty()) {	
			return "redirect:/user/login";
		}else {
			String user_id = getRequestSessionAttribute(request, "user_id");
			String us_token = getRequestSessionAttribute(request, "us_token");	
			if(pay_type.equals("0")) {
				JSONObject recharge = getJson(HttpUtil.getWebServer("/wpd/user/bscg_user_recharge?transAmt="+transAmt+"&bankCode="+bankCode+"&frontRetUrl="+frontRetUrl+"&user_id="+user_id+"&us_token="+us_token));
				JSONObject rechargeData = JSONObject.parseObject(recharge.getString("requestUrl"));
				setRequestSessionAttribute(request,"recharge", recharge);
				setRequestSessionAttribute(request,"rechargeData", rechargeData);
				//System.out.println(frontRetUrl);
			}else {
				JSONObject recharge = getJson(HttpUtil.getWebServer("/wpd/user/bscg_user_recharge_fast?transAmt="+transAmt+"&pay_pwd="+pay_pwd+"&frontRetUrl="+frontRetUrl+"&user_id="+user_id+"&us_token="+us_token));
				JSONObject rechargeData = JSONObject.parseObject(recharge.getString("requestUrl"));
				setRequestSessionAttribute(request,"recharge", recharge);
				setRequestSessionAttribute(request,"rechargeData", rechargeData);			
			}		
			return "/jump/openRecharge";
		}
    }
}
