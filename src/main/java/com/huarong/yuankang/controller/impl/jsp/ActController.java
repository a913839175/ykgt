package com.huarong.yuankang.controller.impl.jsp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



import com.huarong.yuankang.controller.BaseController;


//活动页面
@Controller
@EnableAutoConfiguration
public class ActController extends BaseController{

	//活动页面
	@RequestMapping(value="/act/{actid}",method=RequestMethod.GET)
	public String about(HttpServletRequest request,@PathVariable String actid){
		return "/act/"+actid;	
	}
}