<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/mall_meta.jsp"%>
<link rel="stylesheet" type="text/css" href="${cdnServer}/static/weipaidai/css/mall/city-picker.css?v=${version}">
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/mall/iframeaddr.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"mall/iframeaddr"};
</script>
<body>
   <div id="iframe">
        <div class="form-box" id="J_FormBox">
            <div class="item item-title ">
                <span class="item-label tsl"><c:if test="${empty aid}">新增</c:if><c:if test="${not empty aid}">修改</c:if>收货地址<i></i></span>
                <span class="tsl">电话号码、手机号选填一项, 其余均为必填项</span>
            </div>
            <div class="item clearfix">
                <span class="item-label tsl">所在地区<i>*</i></span>
                <div class="item-select"><p>中国大陆<i class="dropdown"></i></p></div>
                <div class="item-select citySelect" id="distpicker">
                    <div style="position: relative;">
                        <input id="city-picker" class="form-control city-picker-input" readonly="" type="text" data-toggle="city-picker" datatype="*" sucmsg="&nbsp;" errormsg="请选择省/市/区" nullmsg="请选择省/市/区">
                    </div>
                </div>
            </div>
            <div class="item clearfix">
                <span class="item-label tsl">详细地址<i>*</i></span>
                <div class="item-textarea-box">
                    <textarea class="item-textarea" placeholder="建议您如实填写详细收货地址，例如街道名称，门牌号码，楼层和房间号等信息" datatype="*" sucmsg="&nbsp;" errormsg="5-120个字符，一个汉字为两个字符" nullmsg="5-120个字符，一个汉字为两个字符" maxlength="60"></textarea>
                </div>
                <div class="item-textarea-error"></div>
            </div>
            <div class="item clearfix">
                <span class="item-label tsl">邮政编码<i></i></span>
                <input class="item-input" type="text" name="zipCode" maxlength="25" placeholder="如您不清楚邮递区号，请填写000000" id="J_FormPostal">
            </div>
            <div class="item clearfix">
                <span class="item-label tsl">收货人姓名<i>*</i></span>
                <div class="item-input-box">
                    <input class="item-input" type="text" name="shName" maxlength="25" datatype="*" sucmsg="&nbsp;" errormsg="长度不超过25个字符" nullmsg="长度不超过25个字符" placeholder="长度不超过25个字符" id="J_FormshName">
                </div>        
                <div class="item-error"></div>
            </div>
            <div class="item clearfix">
                <span class="item-label tsl">手机号码<i>*</i></span>
                <div class="item-select phone-slt"><p>中国大陆 +86<i class="dropdown"></i></p></div>
                <div class="item-input-box">
                    <input class="item-input" type="text" name="Phone" maxlength="11" datatype="m" sucmsg="&nbsp;" errormsg="请输入正确的手机号码" nullmsg="电话号码、手机号码必须填一项" placeholder="电话号码、手机号码必须填一项" id="J_FormPhone">
                </div>
                <div class="item-error"></div>
            </div>
            <div class="item clearfix">
                <span class="item-label tsl">电话号码<i></i></span>
                <div class="item-select phone-slt"><p>中国大陆 +86<i class="dropdown"></i></p></div>
                <div class="item-warp">
                    <input class="item-input item-area" type="text" name="area" maxlength="6" placeholder="区号"> -
                </div>
               
                <div class="item-warp">
                    <input class="item-input item-dphone" type="text" name="dphone" maxlength="10" placeholder="电话号码"> -
                </div>
                <div class="item-warp">
                    <input class="item-input item-fephone" type="text" name="fephone" maxlength="6" placeholder="分机">
                </div>
            </div>
            <div class="item item-set-default">
                <input type="checkbox" checked="checked" class="i-chk" name="defaultAddress"> 
                <label for="J_SetDefault" class="tsl">设置为默认收货地址</label>
            </div>
            <div class="item clearfix">
                <button type="button" class=" btn  tsl" id="Addrsave">保存</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">seajs.use(OP_CONFIG.page);</script> 
</body>
</html>

