package com.huarong.yuankang.controller.impl.jsp;


import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.huarong.framework.util.HttpUtil;
import com.huarong.yuankang.controller.BaseController;

//我要投资
@Controller
@EnableAutoConfiguration
@RequestMapping("/invest")
public class InvestController extends BaseController{
	//投资页 	
	@RequestMapping("/{type}")
	public String yearlist(HttpServletRequest request,@PathVariable String type){
		setRequestAttribute(request,"type", type);
		return "/index/invest";
	}	
	//投资详情页
	@RequestMapping("/detail/{type}/{nid}")
	public String detail(HttpServletRequest request,@PathVariable String type,@PathVariable String nid){
		setRequestAttribute(request,"type", type);
		setRequestAttribute(request,"nid", nid);
		JSONObject detailList = new JSONObject();
		String user_id = getRequestSessionAttribute(request, "user_id");
		String us_token = getRequestSessionAttribute(request, "us_token");
		if(type!=null && type.equals("loan")){
			detailList = getJson(HttpUtil.getWebServer("/wpd/index/borrow/product_borrow_detail?loan_nid="+nid));
			setRequestAttribute(request,"detailList", detailList);
			if(detailList == null ||detailList.isEmpty()) {
				return "404";
			}	
			JSONObject borrowInfo = getJson(HttpUtil.getWebServer("/wpd/index/borrow/get_borrow_user_info?borrow_nid="+nid));
			setRequestAttribute(request,"borrowInfo", borrowInfo);
		}else{
			detailList = getJson(HttpUtil.getWebServer("/wpd/index/borrow/product_borrow_detail_list?shut_id="+nid));
			setRequestAttribute(request,"detailList", detailList);
			
			if(detailList == null ||detailList.isEmpty()) {
				return "404";
			}
		}		
		if(user_id !=null && us_token != null) {
			JSONObject usermain = getJson(HttpUtil.getWebServer("/wpd/user_query/user_main?user_id="+user_id+"&us_token="+us_token));
			setRequestSessionAttribute(request,"usermain", usermain);
			
			JSONObject hbList = getJson(HttpUtil.getWebServer("/wpd/user_query/hongbaolist?user_id="+user_id+"&us_token="+us_token+"&status=0"));
			setRequestAttribute(request,"hbList", hbList);
		}
		return "/index/invest_detail";		
	}
}