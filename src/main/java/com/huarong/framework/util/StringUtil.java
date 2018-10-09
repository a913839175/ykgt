package com.huarong.framework.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.log4j.Logger;


 

public final class StringUtil {
    /** 日志记录 */
    private static Logger logger = Logger.getLogger(StringUtil.class);
    /** 类标识 */
    private static int serial = 0;


    /**
     * i is further <=0 thanreturn "" else return 
     * seprator String ^
     * 
     * */
    public static String getSquareSep(Integer i){
		return i<=0?"":"^";
	}

    /**
     * split String \\^
     * 
     * */
    public static String getSplit(){
    	return "\\^";
    }
    
    public static String getSplitSemicolon(){
    	return "\\;";
    }
    
    /**
     * 判断字符串是否为空
     * 
     * @param strVal
     *            string
     * @return true 为空 false 不为空
     */
    public static boolean isEmpty(String strVal) {
        return strVal == null || trim(strVal).equals("");
    }

    /**
     * 判断字符串是否为空
     * 
     * @param strVal
     *            string
     * @return true 不为空 false 为空
     */
    public static boolean isNotEmpty(String strVal) {
        return !isEmpty(strVal);
    }

    /**
     * 去除左右边全、半角空格
     * 
     * @param strValue
     *            字符串
     * @return String 去除左右边全、半角空格字符串
     */
    public static String trim(String strValue) {

        if ((strValue != null) && (!strValue.equals(""))) {
            StringBuffer sb = new StringBuffer();
            StringBuffer sb1 = new StringBuffer();
            String strRet = "";
            sb.append(rTrim(strValue));
            // 反转后去掉右空格
            strRet = rTrim(sb.reverse().toString());
            sb1.append(strRet);
            strRet = sb1.reverse().toString();
            return strRet.trim();
        } else {
            return "";
        }
    }

    /**
     * 如果对象不为空则将对象转换成字符串返回,否则返回空
     * 
     * @param obj
     *            对象
     * @return 返回非空字符串
     */
    public static String nullToString(Object obj) {
        String ret = "";
        if (obj != null) {
            ret = String.valueOf(obj);
        }
        return ret;
    }

    /**
     * 如果对象不为空则将对象转换成字符串并去除空格返回,否则返回空
     * 
     * @param obj
     *            对象
     * @return 返回非空字符串
     */
    public static String objTrim(Object obj) {
        return nullToString(obj).trim();
    }

    /**
     * 转换null为空字符串.
     * 
     * @param str
     *            String
     * @return String 字符串为null返回空格；否则返回原字符串.
     */
    public static String nullToEmptyString(Object str) {
        String result = null;

        if (null == str) {
            result = "";
        } else {
            result = str.toString();
        }

        return result;
    }

    /**
     * 
     * 转换空字符串为null.
     * 
     * @param str
     *            String
     * @return String 字符串为null返回空格；否则返回原字符串.
     */
    public static String emptyStringToNull(Object str) {
        String result = null;
        String val = str != null ? String.valueOf(str) : null;
        if (!"".equals(trim(val))) {

            result = str.toString();
        }

        return result;
    }

    /**
     * 检查字符串中是否包含某个字符
     * 
     * @param str
     *            需要检查的字符
     * @param compare
     *            字符串
     * @return true 包含改字符 false 不包含改字符
     */
    public static boolean contains(String str, String compare) {
        boolean bool = true;
        if (isEmpty(str)) {
            bool = false;
        } else {
            if (str.indexOf(compare) < 0) {
                bool = false;
            }
        }
        return bool;
    }

    /**
     * 检查字符串中是否包含某个字符
     * 
     * @param str
     *            需要检查的字符
     * @param compare
     *            字符串
     * @return true 不包含改字符 false 包含改字符
     */
    public static boolean notContains(String str, String compare) {
        return !contains(str, compare);

    }

    /**
     * 将首字符大写
     * 
     * @param str
     *            字符串
     * @return 首字符大写的字符串
     */
    public static String toFirstLetterUpperCase(String str) {
        if (StringUtil.isNotEmpty(str)) {
            String firstLetter = str.substring(0, 1).toUpperCase();
            return firstLetter + str.substring(1, str.length());
        } else {
            return str;
        }
    }

    /**
     * 判断字符串是否为数字
     * 
     * @param str
     *            String
     * @return 数字返回true 非数字返回false
     */
    public static boolean isNumber(String str) {
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        if (!isNum.matches()) {
            return false;
        }
        return true;
    }

    /**
     * 转换字符串为Short
     * 
     * @param value
     *            String
     * @return 转换后的Short，失败是返回0
     */
    public static Short toShort(Object value) {

        String val = value != null ? String.valueOf(value) : null;
        try {
            if (isNotEmpty(val)) {
                return Short.valueOf(trim(val));
            }
        } catch (Exception ex) {
            logger.error("Exception: " + ex.getMessage());
        }
        return null;
    }

    /**
     * 转换字符串为Integer
     * 
     * @param value
     *            String
     * @return 转换后的Integer，失败是返回0
     */
    public static Integer toInteger(Object value) {
        String val = value != null ? String.valueOf(value) : null;
        try {
            if (isNotEmpty(val)) {
                return Double.valueOf(trim(val)).intValue();
            }
        } catch (Exception ex) {
            logger.error("Exception: " + ex.getMessage());
        }
        return 0;
    }
    /**
     * 如果输入null则转变为空,其它情况直接toString()
     * 
     * @param inObject
     *            入力对象
     * @return String 字符
     */
    public static String toStringWithEmpty(Object inObject) {

        if (inObject == null) {
            return "";
        } else {
            return inObject.toString();
        }
    }

    /**
     * 转换字符串为Long
     * 
     * @param value
     *            String
     * @return 转换后的Long，失败是返回0
     */
    public static Long toLong(Object value) {
        String val = value != null ? String.valueOf(value) : null;
        try {
            if (isNotEmpty(val)) {
                return Long.valueOf(trim(val));
            }
        } catch (Exception ex) {
            logger.error("Exception: " + ex.getMessage());
        }
        return 0l;
    }

    /**
     * 转换字符串为Float
     * 
     * @param value
     *            String
     * @return 转换后的Double，失败是返回0
     */ 
    public static Float toFloat(Object value) {
        String val = value != null ? String.valueOf(value) : null;
        try {
            if (isNotEmpty(val)) {
                return Float.valueOf(trim(val));
            }
        } catch (Exception ex) {
            logger.error("Exception: " + ex.getMessage());
        }
        return 0.00f;
    }

    /**
     * 转换字符串为Double
     * 
     * @param value
     *            String
     * @return 转换后的Double，失败是返回0
     */
    public static Double toDouble(Object value) {
        String val = value != null ? String.valueOf(value) : null;
        try {
            if (isNotEmpty(val) && !val.equals("null")) {
                return Double.valueOf(trim(val));
            }
        } catch (Exception ex) {
            logger.error("Exception: " + ex.getMessage());
        }
        return 0.00;
    }
    /**
     * 转换字符串为Double
     * 
     * @param value
     *            String
     * @return 转换后的Double，失败是返回0
     */
    public static double parseDouble(Object value) {
        String val = value != null ? String.valueOf(value) : null;
        try {
            if (isNotEmpty(val) && !val.equals("null")) {
                return Double.parseDouble(trim(val));
            }
        } catch (Exception ex) {
            logger.error("Exception: " + ex.getMessage());
        }
        return 0.0;
    }
    /**
     * 转换字符串为BigDecimal
     * 
     * @param value
     *            String
     * @return BigDecimal 转换后的BigDecimal，失败是返回0
     */
    public static BigDecimal toBigDecimal(Object value) {
        String val = value != null ? String.valueOf(value) : null;
        try {
            if (isNotEmpty(val)) {
                return new BigDecimal(trim(val));
            }
        } catch (Exception ex) {
            logger.error("Exception: " + ex.getMessage());
        }
        return BigDecimal.ZERO;
    }

    /**
     * 
     * 4舍5入,保留小数点后2位
     * 
     * @param value
     *            值
     * @param nScal
     *            精度
     * @return String 4舍5入后的值
     */
    public static String toDouble(double value, int nScal) {
        return String.valueOf(new java.math.BigDecimal(value).setScale(nScal, java.math.BigDecimal.ROUND_HALF_UP)
                .doubleValue());
    }

    /**
     * 
     * 4舍5入,保留小数点后2位
     * 
     * @param value
     *            值
     * @return String 4舍5入后的值
     */
    public static String formatDouble(Object value) {
        DecimalFormat df = new DecimalFormat("0.00");
        if (value == null || "".equals(value)) {
            return "0.00";
        } else {
            return df.format(toDouble(value));
        }

    }
    /**
     * 
     * 4舍5入,保留小数点后2位
     * 
     * @param value
     *            值
     * @return String 4舍5入后的值
     */
    public static Double toDoubleTwo(Object value) {
        DecimalFormat df = new DecimalFormat("0.00");
        if (value == null || "".equals(value)) {
            return 0.00;
        } else {
            return Double.valueOf(df.format(toDouble(value)));
        }

    }
    /**
     * 
     * 4舍5入,保留小数点后2位
     * 
     * @param value
     *            值
     * @return String 4舍5入后的值
     */
    public static String toDoubleStrTwo(Object value) {
        DecimalFormat df = new DecimalFormat("0.00");
        if (value == null || "".equals(value)) {
            return "0.00";
        } else {
            return df.format(toDouble(value));
        }

    }
    /**
     * 
     * 4舍5入,保留小数点后6位
     * 
     * @param value
     *            值
     * @return String 4舍5入后的值
     */
    public static Double toDoubleSix(Object value) {
        DecimalFormat df = new DecimalFormat("0.000000");
        if (value == null || "".equals(value)) {
            return 0.00;
        } else {
            return Double.valueOf(df.format(toDouble(value)));
        }

    }
    public static String formatDoubleFour(Object value) {
        DecimalFormat df = new DecimalFormat("0.0000");
        if (value == null || "".equals(value)) {
            return "0.0000";
        } else {
            return df.format(toDouble(value));
        }
    } 
    public static String formatDoubleThree(Object value) {
        DecimalFormat df = new DecimalFormat("0.000");
        if (value == null || "".equals(value)) {
            return "0.000";
        } else {
            return df.format(toDouble(value));
        }

    }
    public static String formatSingle(Object value) {
        DecimalFormat df = new DecimalFormat("0.0");
        if (value == null || "".equals(value)) {
            return "0.0";
        } else {
            return df.format(toDouble(value));
        }

    }
    /**
     * 
     * 4舍5入,保留小数点后2位
     * 
     * @param value
     *            值
     * @return String 4舍5入后的值
     */
    public static String formatDoubleWithNull(Object value) {
        DecimalFormat df = new DecimalFormat("0.00");
        if (value == null || "".equals(value)) {
            return null;
        } else {
            return df.format(toDouble(value));
        }
        
    }
    
    /**
     * 
     * 4舍5入,保留小数点后2位
     * 
     * @param value
     *            值
     * @return String 4舍5入后的值
     */
    public static String formatDoubleWithEmpty(Object value) {
        DecimalFormat df = new DecimalFormat("0.00");
        if (value == null || "".equals(value)) {
            return "";
        } else {
            return df.format(toDouble(value));
        }
        
    }

    /**
     * 
     * 4舍5入,保留小数点后2位
     * 
     * @param value
     *            值
     * @param format
     *            format格式
     * @return String 4舍5入后的值
     */
    public static String formatNum(Object value, String format) {
        DecimalFormat df = new DecimalFormat(format);
        if (value == null) {
            return "";
        } else {
            return df.format(toDouble(value));
        }

    }

    /**
     * 转换字符串为Boolean
     * 
     * @param value
     *            0,1)
     * @return Boolean 1-True/非1-False
     */
    public static Boolean toBoolean(String value) {

        if ("1".equals(value)) {
            return Boolean.TRUE;
        } else {
            return Boolean.FALSE;
        }
    }

    /**
     * 去除右边全半角空格
     * 
     * @param strValue
     *            String
     * @return String String
     */
    private static String rTrim(String strValue) {

        if ((strValue != null) && (!strValue.equals(""))) {
            char[] cValue = strValue.toCharArray();
            int nCur = 0;

            for (int i = cValue.length - 1; i > -1; i--) {
                if ((cValue[i] != '\u0020') && (cValue[i] != '\u3000')) {
                    nCur = i;
                    break;
                }
            }

            if ((nCur == 0) && ((cValue[0] == '\u0020') || (cValue[0] == '\u3000'))) {
                return "";
            }

            return strValue.substring(0, nCur + 1);
        } else {
            return "";
        }
    }

    /**
     * 根据传入的url地址得到JSP的名称
     * 
     * @param strUrl
     *            请求的URL地址
     * @return String String
     */
    public static String getPageNameByUrl(String strUrl) {
        String strResult = null;
        if (!isEmpty(strUrl)) {
            int beginIndex = strUrl.lastIndexOf("/");
            int endIndex = strUrl.lastIndexOf("_");
            int endPointIndex = strUrl.lastIndexOf(".");
            String type = null;
            if (endPointIndex != -1) {
                type = strUrl.substring(endPointIndex + 1);
            }
            if (!isEmpty(type) && type.equalsIgnoreCase("jsp")) {
                if (beginIndex > 0 && endPointIndex > 0) {
                    strResult = strUrl.substring(beginIndex + 1, endPointIndex);
                }
            } else if (beginIndex > 0 && endIndex > 0) {
                strResult = strUrl.substring(beginIndex + 1, endIndex);
            }
        }
        return strResult;
    }

    /**
     * 把数组转换成字符串,中间用逗号分隔
     * 
     * @param obj
     *            数组
     * @return 特殊字符分割的字符串
     */
    public static String getStringByArray(Object[] obj) {
        String resultString = null;
        if (obj != null) {
            resultString = "'";
            for (int i = 0; i < obj.length; i++) {
                resultString += obj[i];
                if (i != obj.length - 1) {
                    resultString += "','";
                } else {
                    resultString += "'";
                }
            }
        }
        return resultString;
    }

    /**
     * 计算两个String的商值
     * 
     * @param div1
     *            被除数
     * @param div2
     *            除数
     * @param nValuePointLength
     *            保留小数点几位
     * @return String 结果
     */
    public static String caculateDiv(String div1, String div2, int nValuePointLength) {
        if (!StringUtil.isEmpty(div1) && !StringUtil.isEmpty(div2)) {
            BigDecimal div1Decimal = new BigDecimal(div1);
            BigDecimal div1Decima2 = new BigDecimal(div2);
            div1Decimal = div1Decimal.divide(div1Decima2, nValuePointLength, BigDecimal.ROUND_HALF_EVEN);
            return div1Decimal.toString();
        }
        return "";
    }

    /**
     * 计算两个String的商值，有效小数点为div1原保留小数与除数的位数之和
     * 
     * @param div1
     *            被除数
     * @param div2
     *            除数
     * @return String 结果
     */
    public static String caculateDiv(String div1, String div2) {
        return caculateDiv(div1, div2, null);
    }

    /**
     * 计算两个String的商值，有效小数点为div1原保留指定小数位数,如果传入为null，则取默认的保留小数的位数
     * 
     * @param div1
     *            被除数
     * @param div2
     *            除数
     * @param decimalDigits
     *            精度
     * @return String 结果
     */
    public static String caculateDiv(String div1, String div2, String decimalDigits) {
        // 如果为-1，则取默认规则，否直接带入进行计算
        if (!StringUtil.isEmpty(div1) && !StringUtil.isEmpty(div2)) {
            int nValuePointLength = 0;
            if (StringUtil.isEmpty(decimalDigits)) {
                nValuePointLength = div1.indexOf(".") != -1 ? div1.length() - div1.indexOf(".") - 1 : 0;
            } else {
                nValuePointLength = Integer.parseInt(decimalDigits);
            }
            int nTransRate = StringUtil.toInteger(div2);
            nTransRate = nTransRate / 10;
            while (nTransRate != 0) {
                nValuePointLength++;
                nTransRate = nTransRate / 10;
            }

            BigDecimal div1Decimal = new BigDecimal(div1);
            BigDecimal div1Decima2 = new BigDecimal(div2);
            div1Decimal = div1Decimal.divide(div1Decima2, nValuePointLength, BigDecimal.ROUND_HALF_EVEN);
            return caculateDiv(div1, div2, nValuePointLength);
        }
        return "";

    }

    /**
     * ArrayList数组转换成String数组.
     * 
     * @param lstArray
     *            List
     * @return String[] strTempArray
     */
    @SuppressWarnings("rawtypes")
    public static String[] arrayListToStringArray(List lstArray) {
        String[] strTempArray = null;

        try {
            if (lstArray != null) {
                strTempArray = new String[lstArray.size()];

                for (int i = 0; i < lstArray.size(); i++) {
                    strTempArray[i] = (String) lstArray.get(i);
                }
            }
        } catch (Exception ex) {
            logger.error("Exception: " + ex.getMessage());
        }

        return strTempArray;
    }

    /**
     * 拼写标签的属性值
     * 
     * @param name
     *            属性名称
     * @param value
     *            属性值
     * @return 属性字符串
     */
    public static StringBuffer setAtrribute(String name, String value) {
        // 返回生成的属性字符串
        StringBuffer sbHtml = new StringBuffer();
        if (StringUtil.isNotEmpty(name)) {
            sbHtml.append(" ");
            sbHtml.append(name);
            sbHtml.append(" = \"");
            sbHtml.append(value);
            sbHtml.append("\"");
        }
        return sbHtml;
    }



    /**
     * trim数字最后的0
     * 
     * @param num
     *            数字
     * @param piontNum
     *            小数点位数
     * @return 属性字符串
     */
    public static String trimEndZero(double num, int piontNum) {
        String strNum = "" + num;
        try {
            if (isNotEmpty(strNum) && strNum.indexOf(".") > -1) {
                num = num * Math.pow(10, piontNum + 1);
                num = (num + 5) / Math.pow(10, piontNum + 1);
                strNum = "" + new BigDecimal("" + num);
                String val1 = strNum.substring(0, strNum.indexOf("."));
                String val2 = strNum.substring(strNum.indexOf(".") + 1);
                if (isNotEmpty(val2)) {
                    while (val2.endsWith("0")) {
                        val2 = val2.substring(0, val2.length() - 1);
                    }
                }
                if (isNotEmpty(val2)) {
                    if (val2.length() > piontNum) {
                        val2 = val2.substring(0, piontNum);
                    }
                    strNum = val1 + "." + val2;
                } else {
                    strNum = val1;
                }
            }
        } catch (Exception ex) {
            logger.error("Exception: " + ex.getMessage());
        }
        return strNum;
    }

    /**
     * 数字转化成大写人名币
     * 
     * @param m
     *            传入数值（单位：元）
     * @return 大写人民币
     */
    public static String getNumberToRMB(String m) {
        String num = "零壹贰叁肆伍陆柒捌玖";
        String dw = "圆拾佰仟万亿";
        String mm[] = null;
        mm = m.split("\\.");
        String money = mm[0];

        String result = num.charAt(Integer.parseInt("" + mm[1].charAt(0))) + "角"
                + num.charAt(Integer.parseInt("" + mm[1].charAt(1))) + "分";

        for (int i = 0; i < money.length(); i++) {
            String str = "";
            int n = Integer.parseInt(money.substring(money.length() - i - 1, money.length() - i));
            str = str + num.charAt(n);
            if (i == 0) {
                str = str + dw.charAt(i);
            } else if ((i + 4) % 8 == 0) {
                str = str + dw.charAt(4);
            } else if (i % 8 == 0) {
                str = str + dw.charAt(5);
            } else {
                str = str + dw.charAt(i % 4);
            }
            result = str + result;
        }
        result = result.replaceAll("零([^亿万圆角分])", "零");
        result = result.replaceAll("亿零+万", "亿零");
        result = result.replaceAll("零+", "零");
        result = result.replaceAll("零([亿万圆])", "$1");
        result = result.replaceAll("壹拾", "拾");

        return result;
    }

    /**
     * 将阿拉伯数字转化成中文数字，处理百位以下部分，超过99的，以传入数值返回
     * 
     * @param num
     *            传入要转换的数字
     * 
     * @return 返回转换后的中文字符串
     */
    public static String numToStr(String num) {
        // 去除空格
        num = StringUtil.trim(num);
        String strNum = "一二三四五六七八九";
        String strShi = "十";
        // 返回值
        String result = "";
        // 判断为数字
        if (Pattern.compile("^\\d+$").matcher(num).find()) {
            if (num.length() == 2) {
                int n = Integer.parseInt(num.substring(0, 1)) - 1;
                int n1 = Integer.parseInt(num.substring(1)) - 1;
                if (n == 0) {
                    result += strShi;
                } else if (n > 0) {
                    result += strNum.charAt(n) + strShi;
                }
                if (n1 > -1) {
                    result += strNum.charAt(n1);
                }
            } else if (num.length() == 1) {
                int n = Integer.parseInt(num);
                if (n > -1) {
                    result += strNum.charAt(n);
                }
            }
        }
        if (StringUtil.isEmpty(result)) {
            result = num;
        }
        return result;
    }

    /**
     * 产生通用惟一标识符
     * 
     * @return 通用惟一标识符（字符串）
     */
    public static String makeUUID() {
        StringBuffer ret = new StringBuffer();
        SimpleDateFormat dfDate = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        dfDate.setLenient(false);
        ret.append(dfDate.format((new GregorianCalendar()).getTime()));

        DecimalFormat dfNum = new DecimalFormat("000");
        ret.append(dfNum.format(serial++));
        if (serial > 999) {
            serial = 0;
        }
        UUID uuid = UUID.randomUUID();
        ret.append(uuid.toString().replace("-", "").subSequence(0, 12));

        return ret.toString();
    }

    /**
     * 将文本域中的字符\r\n,转化成html<br/>
     * 标签
     * 
     * @param str
     *            参数
     * @return HTML字符串
     */
    public static String changeToHtml(String str) {
        String html = null;
        if (str != null) {
            html = str.replaceAll("\r\n", "<br/>");
        }
        return html;
    }

    /**
     * 处理静态SQL的特殊字符
     * 
     * @param strValue
     *            参数
     * @return 处理后的SQL字符串
     */
    public static String encodeForSql(String strValue) {
        try {
            if (strValue == null) {
                return null;
            }

            String strSrc = strValue.trim();
            String strTemp = "";

            for (int k = 0; k < strSrc.length(); k++) {
                char chrTemp = strSrc.charAt(k);
                if (chrTemp == '\'') {
                    strTemp += "\'\'";
                } else {
                    strTemp += chrTemp;
                }
            }

            return strTemp;
        } catch (Exception ex) {
            logger.error("Exception: " + ex.getMessage());
        }
        return null;
    }
    public static String encodeForOrSql(String strValue) {
        try {
            if (strValue == null) {
                return null;
            }

            String strSrc = strValue.trim();
            String strTemp = "";

            for (int k = 0; k < strSrc.length(); k++) {
                char chrTemp = strSrc.charAt(k);
                if (chrTemp == '\'') {
                    strTemp += "\'\'";
                }else if(chrTemp == '{'){
                	strTemp += "｛";
                }else {
                    strTemp += chrTemp;
                }
            }

            return strTemp;
        } catch (Exception ex) {
            logger.error("Exception: " + ex.getMessage());
        }
        return null;
    }
    /**
     * 根据给定的汉字串生产对应的拼音串(只含每个汉字拼音的首字母)
     * 
     * @param src
     *            汉字串
     * @return 汉字拼音首字母的字母串
     */
   /* public static String createPinYin(String src) {
        char[] t1;
        t1 = src.toCharArray();
        String[] t2 = new String[t1.length];
        HanyuPinyinOutputFormat t3 = new HanyuPinyinOutputFormat();
        t3.setCaseType(HanyuPinyinCaseType.UPPERCASE);
        t3.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
        t3.setVCharType(HanyuPinyinVCharType.WITH_V);
        String t4 = ""; 
        int t0 = t1.length;
        try {
            for (int i = 0; i < t0; i++) {
                // 判断是否为汉字字符函数
                if (java.lang.Character.toString(t1[i]).matches("[\\u4E00-\\u9FA5]+")) {
                    t2 = PinyinHelper.toHanyuPinyinStringArray(t1[i], t3);
                    t4 += t2[0].substring(0, 1);
                } else {
                    t4 += java.lang.Character.toUpperCase(t1[i]);
                }
            }
            return t4;
        } catch (BadHanyuPinyinOutputFormatCombination e1) {
            e1.printStackTrace();
        }
        return t4;
    }*/

    /**
     * urlStr转化为Set<String>
     * 
     * @param urlStr
     *            String
     * @return Set<String>
     */
    public static Set<String> parseUrl(String urlStr) {
        Set<String> urlSet = new TreeSet<String>();

        if (urlStr != null) {
            String[] urlArray = urlStr.split(",");
            if (urlArray != null && urlArray.length > 0) {
                for (String url : urlArray) {
                    urlSet.add(url.trim());
                }
            }
        }

        return urlSet;
    }



    /**
     * 将数字用0补充相应的位数
     * 
     * @param val
     *            补充的值
     * @param num
     *            补充位数
     * @return 补充后的字符串
     */
    public static String fillInInStringTOString(String val, Integer num) {
        String retVal = val;
        if (isNotEmpty(val) && num > 0) {
            for (int i = val.length(); i < num; i++) {
                retVal = "0" + retVal;
            }
        }
        return retVal;
    }

    /**
     * 复制文字进入文件
     * 
     * @param filePath 文件
     * @param text 文本
     * @throws IOException 异常
     */
    public static void copyToFile(String filePath, String text) throws IOException {
        File file = new File(filePath);
        if (!file.exists()){
            file.createNewFile();
        }
        FileOutputStream out = new FileOutputStream(file, false);
        StringBuffer sb = new StringBuffer();
        sb.append(text.replace(";", "\n"));
        out.write(sb.toString().getBytes("utf-8"));
        out.close();
    }

    /**
     * 判断字符串是否为数字
     * 
     * @param station
     * @return
     */
    public static boolean isNumeric(String str) {
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        if (!isNum.matches()) {
            return false;
        }
        return true;
    }
    
    /**
     * 处理bean中英文单引号以及回车
     * @param strValue
     * @return
     */
    public static String encodeForBean(String strValue) {
        try {
            if (strValue == null) {
                return null;
            } 
            String strTemp =strValue.replace("'", "‘").replace("\r\n", "");
            return strTemp;
        } catch (Exception ex) {
            logger.error("Exception: " + ex.getMessage());
        }
        return null;
    }

    /**
     * 字符串中的中文转换编码
     * 
     * @param chm
     * @return
     */
    public static String replaceChm(String chm) {
        String re = chm;
        Pattern p = Pattern.compile("\\=(.*?)(\\&|$)");
        Matcher m = p.matcher(chm);
        while (m.find()) {
            String value = m.group(1);
            try {
                re = re.replace(value, URLEncoder.encode(value, "UTF-8"));
            } catch (UnsupportedEncodingException e) {
                StackTraceElement stackTraceElement= new Throwable().getStackTrace()[0];String classname= stackTraceElement.getClassName();String funname=stackTraceElement.getMethodName();int linenumber=stackTraceElement.getLineNumber();logger.error("Windymis[Class:"+classname+";fun:"+ funname+";linenumber:"+ linenumber+"]"); e.printStackTrace();
            }
        }
        return re;
    }
    /**
     * 将数组转化为String
     * 
     * @param chm
     * @return
     */
    public static String arrayToJsString(Object[] o) {
        String result = "[";
        if (o != null && o.length > 0) {
            for (Object a : o) {
                if (a instanceof String) {
                    result += a+",";
                }else if (a instanceof Double) {
                    result += a+",";
                }else{
                    result += "'-',";
                }
            }
            result = result.substring(0, result.length()-1);
        }
        result += "]";
        return result;
    }
    /**
     * 将数组转化为String
     * 
     * @param chm
     * @return
     */
    public static String arrayToJsDouString(Object[] o) {
        String result = "[";
        if (o != null && o.length > 0) {
            for (Object a : o) {
                if (a instanceof String) {
                    result += a+",";
                }else if (a instanceof Double) {
                    result += a+",";
                }else{
                    result += "0.0,";
                }
            }
            result = result.substring(0, result.length()-1);
        }
        result += "]";
        return result;
    }
    /**
	 * 将系统参数中的参数值字符串解析为字符Map
	 * @author Gellss
	 * @param str 待解析的字符串
	 * @return 参数中以=隔开的字符Map
	 * @throws Exception
	 */
	public static Map<String, String> parseSysParm(String str) throws Exception
	{
		
		String value=str;
		
		if(value==null||value.trim().length()<1)
		{
			throw new Exception("传入字符串为空!");
		}
		Map<String,String> map=new LinkedHashMap<String,String>();
		String[] args=value.split("\r\n");
		for(int i=0;i<args.length;i++)
		{
			args[i]=args[i].trim();
			if(args[i].length()<3||args[i].startsWith("#")||args[i].startsWith("//"))
			{
				continue;
			}
			int location=args[i].indexOf('=');
			if(location==-1)
			{
				location=args[i].indexOf('＝');
			}
			if(location==-1)
			{
				throw new Exception("参数配置错误！字符串["+str+"]中"+args[i]+"项缺少'='");
			}
			map.put(args[i].substring(0, location), args[i].substring(location+1, args[i].length()));
		}
	
		return map;
	}
}
