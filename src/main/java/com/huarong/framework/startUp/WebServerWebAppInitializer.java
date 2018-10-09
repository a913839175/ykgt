package com.huarong.framework.startUp;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.WebApplicationInitializer;



@Component
public class WebServerWebAppInitializer implements WebApplicationInitializer{

    public void onStartup(ServletContext servletContext) throws ServletException {
        // XmlWebApplicationContext appContext = new XmlWebApplicationContext();
        // appContext.setConfigLocation("classpath:spring-mvc.xml");
        // ServletRegistration.Dynamic dispatcher = servletContext.addServlet("dispatcher", new DispatcherServlet(appContext));
        // dispatcher.setLoadOnStartup(1);
        // dispatcher.addMapping("/");
    	  	
    	// 注意这里要指向原先用main方法执行的Application启动类
    	
    	System.out.println("the YuanKangWebServer will be init!");
		init(servletContext);
		System.out.println("the YuanKangWebServer startup successful!");
	}
	@Value("${cdnServer}")
	private String cdnServer;

    public void init(ServletContext servletContext){ 	
    	SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
		String version = df.format(new Date());
   		try{ 			
   			//静态文件服务地址
   			servletContext.setAttribute("cdnServer", cdnServer);
   			
   			servletContext.setAttribute("version", version);
   		} 
   		catch(Exception ex){
   			ex.printStackTrace();
   		}
   	}
}