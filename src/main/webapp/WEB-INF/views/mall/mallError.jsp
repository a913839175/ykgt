<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/mall_meta.jsp"%>
<link rel="stylesheet" href="/static/weipaidai/css/mall/orderconfirm.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"mall/orderconfirm"};
</script>
<%@ include file="../common/mall_header.jsp"%>
<!-- 确认订单 -->
<div id="content">
    <div class="maincontent">
        <div class="breaditem">
            <ul class="breadcrumb">
                <li><a href="/mall">首页</a><i>></i></li>
                <li><a href="javascript:void(0);">确认订单</a></li>
            </ul>
        </div>
         <div class="suremain">
             <div class="smallmain">
                <div class="productz clearfix">
                    <div class="sureinfo01 clearfix fl">
                        <img data-src="${productDetail.product.img}" class="sureinfo01img">
                        <div class="sureinfo01_01">
                            <div class="sureinfo01_01top">${productDetail.product.name}</div>
                            <div class="sureinfo01_01bottom"></div>
                        </div>
                     </div>
                     <p class="vernumz fl">数量:<em id="vernum">${count}</em></p>
                     <p class="vervbiz fl">使用微币数：<em id="vervbi">${productDetail.product.discountPrice*count}</em></p>
                </div>
                <p class="verms mrt30">手机号码：</p>
                <input type="text" class="intphone" maxlength ='11' disabled="true" value="${userinfo.user_name}">
                <p class="verms mat19">验证码：</p>
                <div class="smscodez clearfix">
                    <input type="hidden" name="aid" value="${aid}" id="itemAid">
                    <input type="hidden" name="sid" value="${productDetail.product.id}" id="itemSid">
                    <input type="hidden" name="count" value="${count}" id="itemCount">
                    <input type="text" class="smscode fl" datatype="*" sucmsg="&nbsp;" nullmsg="请输入手机验证码" errormsg="手机验证码错误" autocomplete="off" maxlength="6" type="text" placeholder="请输入短信验证码">
                    <button class="senddx fl">发送验证码</button>
                </div>
                <button class="surecode">确认订单</button>
             </div>
         </div>
    </div>   
</div>
<script type="text/javascript">
G.$alert("页面已失效",false,function(){
    window.location="/mall";
},true);
</script>
<%@ include file="../common/footer.jsp"%>