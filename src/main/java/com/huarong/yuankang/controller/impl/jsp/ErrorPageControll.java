package com.huarong.yuankang.controller.impl.jsp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ErrorPageControll implements ErrorController{
	
    private final static String ERROR_PATH = "/error";

    @RequestMapping(value = ERROR_PATH, produces = "text/html")
    public String errorHtml(HttpServletRequest request, Exception e) throws Exception{
    	Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
    	request.setAttribute("title", "页面不存在-");
    	request.setAttribute("statusCode", statusCode);
    	if(statusCode.equals(500)) {
    		request.setAttribute("title", "页面500错误-");
    	}
        return "404";
    }


    @RequestMapping(value = ERROR_PATH)
    @ResponseBody
    public Object error(HttpServletRequest request, Exception e) throws Exception{
    	request.setAttribute("title", "页面不存在-");	
        return "请求失败！";
    }


    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }
}