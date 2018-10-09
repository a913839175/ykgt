<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/userlogin.css?v=${version}" />
<script type="text/javascript">
	var OP_CONFIG={"page":"page/login"};
</script>
<%@ include file="../common/header.jsp"%>  
<div class="content">
	<div class="dlbox clearfix">
		<img src="${cdnServer}/static/weipaidai/images/login02.png" class="dlboximg fl">
		<div class="dlright fl">
			<div class="dlright1 clearfix">
				<p class="dlrightfms1 fl">欢迎登录</p>
				<p class="dlrightfms2 fr">还没有账号，<a href="/user/reg">立即注册></a></p>
			</div>
			<p class="dlerror">
				<span class="Validform_checktip Validform_wrong"></span>
			</p>
			<div class="dlphone">
				<input type="text" name="J_phone"  placeholder="请输入您的手机号码" maxlength ='30' class="dlphoneinput" datatype="phone" errormsg="手机号码格式错误" nullmsg="手机号码不能为空" sucmsg="&nbsp;">						
			</div>
			<div class="dlpassword">
				<input type="password" name="J_password"  placeholder="密码要求6-20位字符" maxlength ='20' class="dlpasswordinput" datatype="*6-20" errormsg="密码要求6-20位字符" nullmsg="登录密码不能为空" sucmsg="&nbsp;">			
			</div>
			<div class="dlselect">
				<div class="dlselect-btn active" data-value="01"><label></label>投资人</div>
				<div class="dlselect-btn" data-value="02"><label></label>借款人</div>
			</div>			
			<div id="drag">
				<div class="ui-slider-wrap" style="width: 340px; height: 40px; background-color: rgb(232, 232, 232);">
					<div class="ui-slider-text ui-slider-no-select" style="line-height: 40px; font-size: 14px; color: rgb(170, 170, 170);">请按住滑块，拖动到最右边</div>
					<div class="ui-slider-btn init ui-slider-no-select" style="width: 40px; height: 40px; line-height: 40px; left: 0px;"></div>
					<div class="ui-slider-bg" style="height: 40px; background-color: rgb(51, 204, 0); width: 0px;"></div>
				</div>
			</div>
			<span class="drag_checktip"></span>
			<div class="dlfind">
				<a href="/user/findPwd" class="forgetpass">忘记密码？</a>
			</div>		
			<button type="submit" class="dlsure" id="dlsure">登录</button>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/accountfooter.jsp"%>
