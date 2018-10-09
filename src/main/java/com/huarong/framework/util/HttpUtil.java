package com.huarong.framework.util;

import java.util.Locale;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;


public class HttpUtil {
	private static Locale locale = new Locale("zh", "CN");
	private static ResourceBundle bundle = PropertyResourceBundle.getBundle("properties/message",locale);

	/**
	 * 按给定的Key取对应的参数值。
	 * @param key
	 * @return 
	 */ 
	public static String getProperties(String key) {
		return bundle.getString(key);
	} 

	public static String getWebServer(String params) {
		String webServer = HttpUtil.getProperties("webServer");
		String url = webServer + params;
		return url;
	}
	

	public static String getRedisJob(String params){
		String RedisJob = HttpUtil.getProperties("RedisJob");
		String url = RedisJob + params;
		return url;
	}
}
