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
import com.huarong.framework.util.DesJsUtil;
import com.huarong.framework.util.HttpUtil;
import com.huarong.yuankang.controller.BaseController;


//微商城
@Controller
@EnableAutoConfiguration
public class MallController extends BaseController{
	//维护页
	@RequestMapping(value="/mall/malldenfend",method=RequestMethod.GET)
	public String malldenfend(HttpServletRequest request){
		setRequestAttribute(request,"title", "系统维护页");
		return "/mall/malldenfend";	
	}
	//微商城首页
	@RequestMapping(value="/mall")
	public String mall(HttpServletRequest request){
	   setRequestAttribute(request,"title", "微商城");
	   String user_id = getRequestSessionAttribute(request, "user_id");
	   //banner图
	   JSONObject bannerList = postJson(HttpUtil.getRedisJob("/user/we_mall/bannerList"),"");		
       setRequestAttribute(request,"bannerList", bannerList);
       //商品列表
	   JSONObject productList = postJson(HttpUtil.getRedisJob("/user/we_mall/productList?recomCount=3&productCount=4"),"");		
       setRequestAttribute(request,"productList", productList);
       //当前可用微币
	   JSONObject currency = postJson(HttpUtil.getRedisJob("/user/we_mall/currency?user_id=" + user_id),"");		
       setRequestAttribute(request,"currency", currency);
	   return "/mall/index";	
	}
	//商品详情页
	@RequestMapping("/mall/item")
	public String mallitem(HttpServletRequest request,String sid){
		setRequestAttribute(request,"title", "商品详情页");
		setRequestAttribute(request,"sid", sid);
		String user_id = getRequestSessionAttribute(request, "user_id");
		JSONObject productDetail = postJson(HttpUtil.getRedisJob("/user/we_mall/productDetail?productId="+sid),"");		
	    setRequestAttribute(request,"productDetail", productDetail);
	    
	    JSONObject currency = postJson(HttpUtil.getRedisJob("/user/we_mall/currency?user_id=" + user_id),"");		
	    setRequestAttribute(request,"currency", currency); 

	    String returnCode = productDetail.getString("returnCode");
	    if(productDetail == null|| productDetail.isEmpty() || returnCode.equals("-3")) {		
    		return "404";
    	}
		return "mall/item";
	}
	//商品分类
	@RequestMapping(value="/mall/productinfo/{id}",method=RequestMethod.GET)
	public String productinfo(HttpServletRequest request,@PathVariable String id){
		setRequestAttribute(request,"title", "商品分类");
		return "/mall/productinfo";	
	}
	//微币记录
	@RequestMapping(value="/mall/wbrecord",method=RequestMethod.GET)
	public String wbrecord(HttpServletRequest request){
		String user_id = getRequestSessionAttribute(request, "user_id");
		//当前可用微币
	    JSONObject currency = postJson(HttpUtil.getRedisJob("/user/we_mall/currency?user_id=" + user_id),"");		
        setRequestAttribute(request,"currency", currency);
		setRequestAttribute(request,"title", "微币记录");
		return "/mall/wbrecord";	
	}
	//管理收货地址
	@RequestMapping(value="/mall/manageaddr",method=RequestMethod.GET)
	public String manageaddr(HttpServletRequest request){
		setRequestAttribute(request,"title", "管理收货地址");
		String user_id = getRequestSessionAttribute(request, "user_id");
		if(user_id == null ||user_id.isEmpty()) {	
			return "redirect:/user/login";
		}
		return "/mall/manageaddr";	
	}
	//新增地址
	@RequestMapping(value="/iframe/addaddr",method=RequestMethod.GET)
	public String iframeAddaddr(HttpServletRequest request,String aid){
		setRequestAttribute(request,"title", "新增地址");
		setRequestAttribute(request,"aid", aid);
		String user_id = getRequestSessionAttribute(request, "user_id");
		if(user_id == null ||user_id.isEmpty()) {	
			return "redirect:/user/login";
		}
		return "/iframe/addaddr";	
	}
	//提交订单
	@RequestMapping(value="/mall/ordersubmit",method=RequestMethod.POST)
	public String ordersubmit(HttpServletRequest request,String sid,String pic,String num,String title,String price,String store){
		setRequestAttribute(request,"title", "提交订单");
		String user_id = getRequestSessionAttribute(request, "user_id");
		if(user_id == null ||user_id.isEmpty()) {	
			return "redirect:/user/login";
		}
		if (sid == null) {
			return "redirect:/mall";
		}
		setRequestAttribute(request,"sid", sid);		
		JSONObject productDetail = postJson(HttpUtil.getRedisJob("/user/we_mall/productDetail?productId="+sid),"");	
	    setRequestAttribute(request,"productDetail", productDetail);
	    
	    setRequestAttribute(request,"pic", pic);
		setRequestAttribute(request,"num", num);
		setRequestAttribute(request,"title", title);
		setRequestAttribute(request,"price", price);
		setRequestAttribute(request,"store", store);
		setRequestSessionAttribute(request,"FormSubmit"+sid, "true");
		JSONObject addressList = postJson(HttpUtil.getRedisJob("/user/we_mall/addressList?user_id="+user_id),"");		
	    setRequestAttribute(request,"addressList", addressList);	
		
		return "/mall/ordersubmit";	
	}
	//确认订单
	@RequestMapping(value="/mall/orderconfirm",method=RequestMethod.POST)
	public String orderconfirm(HttpServletRequest request,String sid,String aid,String count){
		setRequestAttribute(request,"title", "确认订单");
		String user_id = getRequestSessionAttribute(request, "user_id");
		if(user_id == null ||user_id.isEmpty()) {	
			return "redirect:/user/login";
		}
		if (sid == null) {
			return "redirect:/mall";
		}	
		String FormSubmit = getRequestSessionAttribute(request, "FormSubmit"+sid);

		if(FormSubmit == null || FormSubmit.isEmpty()) {
			System.out.print("FormSubmit:"+FormSubmit);
			return "/mall/mallError";
		}	
		JSONObject productDetail = postJson(HttpUtil.getRedisJob("/user/we_mall/productDetail?productId="+sid),"");

	    setRequestAttribute(request,"productDetail", productDetail);    
		setRequestAttribute(request,"count", count);
		setRequestAttribute(request,"aid", aid);
		return "/mall/orderconfirm";	
	}
	//完成订单
	@RequestMapping(value="/mall/ordercomplete",method=RequestMethod.GET)
	public String ordercomplete(HttpServletRequest request,String sid){
		setRequestAttribute(request,"title", "完成订单");
	
		request.getSession().removeAttribute("FormSubmit"+sid);
		String user_id = getRequestSessionAttribute(request, "user_id");
		if(user_id == null ||user_id.isEmpty()) {	
			return "redirect:/user/login";
		}
		return "/mall/ordercomplete";	
	}
	//兑换记录
	@RequestMapping(value="/mall/orderlist",method=RequestMethod.GET)
	public String dhrecord(HttpServletRequest request){
		setRequestAttribute(request,"title", "兑换记录");
		return "/mall/orderlist";	
	}
	//订单详情
	@RequestMapping(value="/mall/orderdetail/{id}",method=RequestMethod.GET)
	public String orderDetail(HttpServletRequest request,@PathVariable String id){
		setRequestAttribute(request,"title", "订单详情");
		JSONObject jsonObj = new JSONObject();
		String user_id = getRequestSessionAttribute(request, "user_id");
		if(user_id == null ||user_id.isEmpty()) {	
			return "redirect:/user/login";
		}
		jsonObj.put("user_id", user_id);
		jsonObj.put("order_id", id);
		String params = jsonObj.toJSONString();
		
		DesJsUtil desObj = new DesJsUtil();
		String unixkey = new Date().getTime()+"";	
		String userVerify = desObj.strEnc(params,"weipaidai",unixkey,"java_http_web");
		
		JSONObject orderDetail = postJson(HttpUtil.getRedisJob("/user/we_mall/orderDetail?unixkey="+unixkey+"&userVerify="+userVerify),"");
    	if(orderDetail == null|| orderDetail.isEmpty()) {		
    		return "404";
    	}
    	SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd");  
        Long time = new Long(orderDetail.getString("time"));  
        String orderdate = format.format(time*1000);
        String address = orderDetail.getString("address").replaceAll("/"," ");
        setRequestAttribute(request,"orderDetail", orderDetail);
        setRequestAttribute(request,"orderdate", orderdate);
        setRequestAttribute(request,"address", address);
		return "/mall/orderDetail";	
	}
}
