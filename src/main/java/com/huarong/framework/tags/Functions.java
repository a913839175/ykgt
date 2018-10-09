package com.huarong.framework.tags;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


import org.springframework.web.util.HtmlUtils;

import com.huarong.framework.util.DesUtil;
import com.huarong.framework.util.StringUtil;

public class Functions {
	
	/**
     * 获取日期
     * 
     * @param Status
     * @return
     */
    public static Date getDate(String str,String formart) {
    	DateFormat format = new SimpleDateFormat(formart);  
        Date date = null;  
        try {  
            date = format.parse(str);   
        } catch (Exception e) {  
            e.printStackTrace();  
        }                                       
        return date;  
    }
    public static Long getLong(String str) {
        return  StringUtil.toLong(str);	
    }
    public static Integer getInt(String str) {
        return  StringUtil.toInteger(str);
    }
    public static String getPwd(String str) {
        return  DesUtil.encrypt(str);
    }
    public static Double getDouble(String str) {
        return  StringUtil.toDouble(str);
    }
    public static String getPhone(String phone) {
    	return phone.replaceAll("(\\d{3})\\d{4}(\\d{4})","$1****$2");
    }
    public static String getThousand(String totalCount) {
    	BigDecimal b = new BigDecimal(totalCount);
    	DecimalFormat d1 =new DecimalFormat("#,##0.####;(#)");
    	return d1.format(b);
    }
    public static String replaceAllStr(String str,String regex,String replacement) {
    	return str.replaceAll(regex, replacement);
    }
    public static String getSubString(String str, int len) {
		if (str.isEmpty()) {
			return "";
		}
		if (str.length() <= len) {
			return str;
		}
		return str.substring(0, len);
	}
    public static String htmlUnescape(String content) {
    	String html = HtmlUtils.htmlUnescape(content);
    	html = html.replaceAll("<.*?>", "  ").replaceAll(" ", " ");
        html = html.replaceAll("<.*?", "");
        html = getSubString(html,320);
        return (html + "...");
    }
}
