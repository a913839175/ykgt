package com.huarong.yuankang.controller.impl.jsp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.HtmlUtils;

import com.alibaba.fastjson.JSONObject;
import com.huarong.framework.util.HttpUtil;
import com.huarong.yuankang.controller.BaseController;


//信息披露
@Controller
@EnableAutoConfiguration
public class DisclosureController extends BaseController{

	//关于我们
	@RequestMapping(value="/about",method=RequestMethod.GET)
	public String about(HttpServletRequest request){
		setRequestAttribute(request,"title", "微拍贷介绍| ");
		setRequestAttribute(request,"type", "introduce");
		return "/info/info_introduce";	
	}
	//微拍贷介绍
	@RequestMapping(value="/introduce",method=RequestMethod.GET)
	public String introduce(HttpServletRequest request){
		setRequestAttribute(request,"title", "微拍贷介绍| ");
		setRequestAttribute(request,"type", "introduce");
		return "/info/info_introduce";	
	}
	//动态与公告
	@RequestMapping(value="/news",method=RequestMethod.GET)
	public String news(HttpServletRequest request){
		setRequestAttribute(request,"title", "动态与公告| ");
		setRequestAttribute(request,"type", "news");
		return "/info/info_news";	
	}
	//动态与公告详情页
	@RequestMapping(value="/news/detail/{nid}",method=RequestMethod.GET)
	public String newsdetail(HttpServletRequest request,@PathVariable String nid){
		/*获取最新动态和公告的详细数据*/
    	JSONObject getSiteResult = getJson(HttpUtil.getWebServer("/wpd/index/get_site_result?nid="+nid));		
    	setRequestAttribute(request,"getSiteResult", getSiteResult);
    	
//		String content = HtmlUtils.htmlUnescape(getSiteResult.getString("content").replaceAll("src=&quot;http://192.168.1.74", "src=&quot;https://www.weipaidai.com/api/bpng"));	
		String content = HtmlUtils.htmlUnescape(getSiteResult.getString("content"));
		setRequestAttribute(request,"content", content);
		setRequestAttribute(request,"type", "news");
		return "/info/info_newsDetail";	
	}
	//管理团队与组织架构
	@RequestMapping(value="/organizational",method=RequestMethod.GET)
	public String organizational(HttpServletRequest request){
		setRequestAttribute(request,"title", "管理团队与组织架构| ");
		setRequestAttribute(request,"type", "organizational");
		return "/info/info_organizational";	
	}
	//资质证书
	@RequestMapping(value="/certificate",method=RequestMethod.GET)
	public String certificate(HttpServletRequest request){
		setRequestAttribute(request,"title", "资质证书| ");
		setRequestAttribute(request,"type", "certificate");
		return "/info/info_certificate";	
	}
	//大事记
	@RequestMapping(value="/chronice",method=RequestMethod.GET)
	public String chronice(HttpServletRequest request){
		setRequestAttribute(request,"title", "大事记| ");
		setRequestAttribute(request,"type", "chronice");
		return "/info/info_chronice";	
	}
	//风险控制
	@RequestMapping(value="/fengkong",method=RequestMethod.GET)
	public String fengkong(HttpServletRequest request){
		setRequestAttribute(request,"title", "风险控制| ");
		setRequestAttribute(request,"type", "fengkong");
		return "/info/info_fengkong";	
	}
	//联系我们
	@RequestMapping(value="/contactus",method=RequestMethod.GET)
	public String contactus(HttpServletRequest request){
		setRequestAttribute(request,"title", "联系我们| ");
		setRequestAttribute(request,"type", "contactus");
		return "/info/info_contactus";
	}
	//收费标准
	@RequestMapping(value="/rates",method=RequestMethod.GET)
	public String rates(HttpServletRequest request){
		setRequestAttribute(request,"title", "收费标准| ");
		setRequestAttribute(request,"type", "rates");
		return "/info/info_rates";
	}
	//合作伙伴
	@RequestMapping(value="/partner",method=RequestMethod.GET)
	public String partner(HttpServletRequest request){
		setRequestAttribute(request,"title", "合作伙伴| ");
		setRequestAttribute(request,"type", "partner");
		return "/info/info_partner";
	}
	//媒体报道
	@RequestMapping(value="/coverage",method=RequestMethod.GET)
	public String coverage(HttpServletRequest request){
		/*获取最新动态和公告的详细数据*/
    	JSONObject getAllMedia = getJson(HttpUtil.getWebServer("/wpd/index/get_all_media"));		
    	setRequestAttribute(request,"getAllMedia", getAllMedia);
		setRequestAttribute(request,"title", "媒体报道| ");
		setRequestAttribute(request,"type", "coverage");
		return "/info/info_coverage";
	}
	//媒体报道详情页
	@RequestMapping(value="/coverage/detail/{nid}",method=RequestMethod.GET)
	public String coverages(HttpServletRequest request,@PathVariable String nid){
		/*获取最新动态和公告的详细数据*/
    	JSONObject getSiteResult = getJson(HttpUtil.getWebServer("/wpd/index/get_site_result?nid="+nid));		
    	setRequestAttribute(request,"getSiteResult", getSiteResult);
    	
		String content = HtmlUtils.htmlUnescape(getSiteResult.getString("content").replaceAll("src=&quot;http://192.168.1.74", "src=&quot;https://www.weipaidai.com/api/bpng"));	
		setRequestAttribute(request,"content", content);
		setRequestAttribute(request,"type", "coverage");
		return "/info/info_newsDetail";	
	}
}
