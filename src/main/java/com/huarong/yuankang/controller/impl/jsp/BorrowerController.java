package com.huarong.yuankang.controller.impl.jsp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.huarong.yuankang.controller.BaseController;


//我的账户--借款账户
@Controller
@EnableAutoConfiguration
public class BorrowerController extends BaseController{
	//我的借款
	@RequestMapping(value="/user/myborrow",method=RequestMethod.GET)
	public String myborrow(HttpServletRequest request){
		setRequestAttribute(request,"type", "myborrow");
		String isLogin = getField(request,"userinfo","user_name");
		if(isLogin == null ||isLogin.isEmpty()) {	
			return "redirect:/user/login?redirectURL=/user/myborrow";
		}else {
			return "/borrower/borrower_myborrow";
		}	
	}
}
