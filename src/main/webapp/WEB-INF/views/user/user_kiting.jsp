<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/kiting.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"page/kiting"};
</script>  
<%@ include file="../common/header.jsp"%>  
<div class="content">
	<div class="recharge-box">
		<h2 class="recharge-title">账户余额：<span class="recharge_account">${usermain.balance}</span><em>元</em></h2>
		<p class="recharge-desc"><img src="${cdnServer}/static/weipaidai/images/safety03.png" class="tipsimg">单日、单笔充值限额遵循各大银行规定，推广期内充值免费</p>
		<div class="bdbank clearfix">
			<p class="fl bdbankp1">绑定银行</p>
			<img data-src="" class="bdbankimg1 fl">
			<p class="fl bdbankp3">尾号<span class="rechargewh"></span></p>
		</div>
		<div class="kitingbank clearfix">
			<p class="fl kitingbankp1">提现金额</p>
			<input type="text" class="fl kitingbankin1" datatype="isNumberthan100" nullmsg="请输入金额" sucmsg=" " errormsg='请输入大于100的金额' placeholder="请输入金额数"  maxlength="12" autocomplete="off">
			<p class="kitingbankp2 fl">元</p>
			<em class="ki-tips"></em>
			<span class="Validform_checktip"></span>
		</div>
		<div class="kitingjy clearfix">
			<p class="fl kitingbankpx1">交易密码</p>
			<input type="password" class="hide">	
			<input type="password" class="fl kitingbankinx1"  datatype="n6-6" sucmsg="&nbsp;" errormsg="交易密码为6位数字,不能有空格" nullmsg="交易密码不能为空" onpaste="return false" name="pay_pwd" placeholder="请输入交易密码" autocomplete="off">			
			<span class="Validform_checktip"></span>
		</div>
		<div class="kitingyx clearfix">
			<input type="checkbox" id="checked" name="agree" checked="checked" datatype="agree" sucmsg="&nbsp;" nullmsg=" ">
			<label for="checked"><em class="checkedBtn"></em>我已阅读并同意<a href="/news/detail/50" target="_blank">《账户使用服务协议》</a></label>
		</div>
		<button class="kitingsure checked-button" id="kitingsure">提现</button>
	</div>
</div>
<%@ include file="../common/accountfooter.jsp"%>

