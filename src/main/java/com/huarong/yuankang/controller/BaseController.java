package com.huarong.yuankang.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.alibaba.fastjson.JSONObject;

public class BaseController {

	 	private static Logger logger = LoggerFactory.getLogger(BaseController.class); 
	
	    public String getRequestAttribute(HttpServletRequest request,String name) {
	    	return request.getAttribute(name)+"";
	    }
	    public void setRequestAttribute(HttpServletRequest request,String name,Object obj) {
	    	request.setAttribute(name, obj);
	    	
	    }
	    public void setRequestSessionAttribute(HttpServletRequest request,String name,Object obj) {
	    	request.getSession().setAttribute(name, obj);
	    }
	    public String getRequestSessionAttribute(HttpServletRequest request,String name) {
	    	String str = (String) request.getSession().getAttribute(name);
	    	return str;
	    }
	    public String getField(HttpServletRequest request,String AttrName,String name) {	
			String str;
	    	JSONObject jsonobject = (JSONObject) request.getSession().getAttribute(AttrName);
	    	if(jsonobject == null){
	    		str = null;
	    	}else {
	    		str = (String) jsonobject.get(name);
	    	}		
			return str;
	    }
	    public static JSONObject postJson(String requestUrl, String outputStr) {
			return getJson(requestUrl,"POST",outputStr);
		}
	    public static JSONObject getJson(String requestUrl) {
			return getJson(requestUrl,"GET","");
		}
		public static JSONObject getJson(String requestUrl, String requestMethod, String outputStr) {    
	        JSONObject jsonObject = new JSONObject();    
	        StringBuffer buffer = new StringBuffer();  
	        InputStream inputStream = null;  
	        try {  
	            URL url = new URL(requestUrl);  
	            HttpURLConnection httpUrlConn = (HttpURLConnection) url.openConnection();    
	            httpUrlConn.setDoOutput(true);    
	            httpUrlConn.setDoInput(true);    
	            httpUrlConn.setUseCaches(false);  
	            // 设置请求方式（GET/POST）    
	            httpUrlConn.setRequestMethod(requestMethod);    
	            if ("GET".equalsIgnoreCase(requestMethod))    
	                httpUrlConn.connect();    	    
	            // 当有数据需要提交时    
	            if (null != outputStr) {    
	                OutputStream outputStream = httpUrlConn.getOutputStream();    
	                // 注意编码格式，防止中文乱码    
	                outputStream.write(outputStr.getBytes("UTF-8"));    
	                outputStream.close();    
	            }  
	            //将返回的输入流转换成字符串    
	            inputStream = httpUrlConn.getInputStream();    
	            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");    
	            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);    
	    
	            String str = null;    
	            while ((str = bufferedReader.readLine()) != null) {    
	                buffer.append(str);    
	            }    
	            bufferedReader.close();    
	            inputStreamReader.close();    
	            // 释放资源    
	            inputStream.close();    
	            inputStream = null;    
	            httpUrlConn.disconnect();    
	            jsonObject = JSONObject.parseObject(buffer.toString());  
	        } catch (ConnectException ce) {
	        	  //System.err.println(ce.getMessage());
	              jsonObject.put("errorMsgInfo",ce.getMessage());
	              jsonObject.put("returnMsg", "网络繁忙，请稍后再试 !");
	              logger.error(requestUrl+"接口请求连接超时---connection timed out------------------");
	        } catch (Exception ex){
	        	 //System.err.println(ex.getMessage());
	             jsonObject.put("errorMsgInfo",ex.getMessage());
	             jsonObject.put("returnMsg", "网络繁忙，请稍后再试 !");
	        	 logger.error(requestUrl+"接口请求异常---connection timed out------------------");
	        }
	        return jsonObject;
		} 
}