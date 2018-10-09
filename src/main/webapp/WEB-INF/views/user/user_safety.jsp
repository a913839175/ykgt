<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_account.css?v=${version}" />
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_safety.css?v=${version}" />
<script type="text/javascript">
	var OP_CONFIG={"page":"page/user_safety"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 安全中心 -->
<div id="content">
	<div class="cont1200 clearfix">
		<%@ include file="user_menu.jsp"%>
		<div class="contentright fl">
			<input type="hidden" class="realname_flag">
			<h2 class="conttile">安全中心</h2>
			<ul class="conbt_ul">
				<li class="conbt_li">
					<div class="conbt_top clearfix">
						<p class="fl conbt_topmz1">为了您的账户安全，请完成以下操作</p>
					</div>
					<p class="conbt_topmz4">上次登录：${userinfo.last_login_time}</p>
				</li>
				<li class="conbt_li1 clearfix">
					<i class="fl conbt_img1"></i>
					<div class="conbt_center fl">
						<div class="conbt_top1 clearfix">
							<p class="fl conbt_topmz5">实名认证</p>							
							<c:if test="${userinfo.realname_flag != 1}">
								<img src="${cdnServer}/static/weipaidai/images/safety03.png" class="norz fl">
								<p class="fl conbt_topmz6">未认证</p>
							</c:if>
						</div>
						<p class="conbt_topmz7">用于提升安全性和信用分。认证后不能修改。</p>
					</div>
					<c:if test="${userinfo.realname_flag != 1}">
						<p class="fr conbt_topmz8" id="realname">认证</p>
					</c:if>
					<c:if test="${userinfo.realname_flag == 1}">
						<p class="fr conbt_topmz8">已认证</p>
					</c:if>			
				</li>
				<!--<li class="conbt_li1 clearfix">
					<i class="fl conbt_img2"></i>
					<div class="conbt_center fl">
						<div class="conbt_top1 clearfix">
							<p class="fl conbt_topmz5">手机号码</p>
							
						</div>
						<p class="conbt_topmz7">资金变动及敏感操作短信通知</p>
					</div>
				</li> -->
				<!--<li class="conbt_li1 clearfix">
					<i class="fl conbt_img3 mat28"></i>
					<div class="conbt_center fl">
						<div class="conbt_top1 clearfix">
							<p class="fl conbt_topmz5">包商银行存管账户</p>
							
						</div>
						<p class="conbt_topmz7">与包商银行合作资金存管，保障用户资金安全</p>
					</div>
					<p class="fr conbt_topmz8" id='Deaccounts'>进入</p>
				</li> -->
				<li class="conbt_li1 clearfix">
					<i class="fl conbt_img4 mat28"></i>
					<div class="conbt_center fl">
						<div class="conbt_top1 clearfix">
							<p class="fl conbt_topmz5">银行卡</p>							
						</div>
						<p class="conbt_topmz7">为保证账户资金安全，请绑定本人的银行卡</p>
					</div>
					<c:if test="${userinfo.bank_flag != 1}">
						<p class="fr conbt_topmz8" id='B_Bnakcard'>绑定</p>
					</c:if>
					<c:if test="${userinfo.bank_flag == 1}">
						<a href="/user/checkbank"><p class="fr conbt_topmz8" id='J_Bnakcard'>查看</p></a>
					</c:if>
				</li>
				<li class="conbt_li1 clearfix">
					<i class="fl conbt_img5"></i>
					<div class="conbt_center fl">
						<div class="conbt_top1 clearfix">
							<p class="fl conbt_topmz5">登录密码</p>
							
						</div>
						<p class="conbt_topmz7">用于保护帐号信息和登录安全，建议每6个月更换1次</p>
					</div>
					<p class="fr conbt_topmz8" id="loginrevamp">修改</p>
				</li>
				<li class="conbt_li1 clearfix">
					<i class="fl conbt_img6"></i>
					<div class="conbt_center fl">
						<div class="conbt_top1 clearfix">
							<p class="fl conbt_topmz5">交易密码</p>						
						</div>
						<p class="conbt_topmz7">账户资金变动和修改账户信息时，需先校验交易密码</p>
					</div>
					<p class="fr conbt_topmz8" id="dealrevamp1">修改</p>
				</li>
			</ul>	
		</div>
	</div>
</div>
<div class="mask" id="J-changep">
	<div class="pop_changep1">
		<h3 class="pop-title">修改密码<span class="pop-close" id="pop_box_closema"></span></h3>
		<div class="pop-main1">
			<form>
				<ul class="pop-mainul">
					<li class="pop-mainli clearfix">
						<p class="pop-mainlip1 fl marl45">旧密码：</p>
						<input type="password" class="pwd fl" maxlength="20" name="password1"  autocomplete="off" onpaste="return false" maxlength="20" type="password" placeholder="请输入旧密码">
					</li>
					<li class="pop-mainli clearfix">
						<p class="pop-mainlip1 fl marl45">新密码：</p>
						<input type="password" class="pwd fl" maxlength="20" name="password2"  datatype="s6-20"  autocomplete="off" onpaste="return false" maxlength="20"  type="password" placeholder="请输入新密码">
					</li>
					<li class="pop-mainli clearfix">
						<p class="pop-mainlip1 fl">确认新密码：</p>
						<input type="password" class="pwd fl" name="password3"  datatype="s6-20" autocomplete="off" onpaste="return false" maxlength="20"  type="password" placeholder="请再次输入新密码">
					</li>
				</ul>
			</form>
			<div class="sure" id='changepassword'></div>
		</div>
	</div>
</div>
<div class="mask" id="J-JY">
	<div class="pop_changep1">
		<h3 class="pop-title">修改交易密码<span class="pop-close"></span></h3>
		<div class="pop-main1">
			<form>
				<ul class="pop-mainul">
					<li class="pop-mainli clearfix">
						<p class="pop-mainlip1 fl marl45">旧密码：</p>
						<input type="password" class="pwd fl" datatype="s6-6" name="Jpassword1"  autocomplete="off" onpaste="return false" maxlength="6" type="password" placeholder="请输入旧密码">
					</li>
					<li class="pop-mainli clearfix">
						<p class="pop-mainlip1 fl marl45">新密码：</p>
						<input type="password" class="pwd fl" datatype="s6-6" maxlength="6" name="Jpassword2" autocomplete="off" onpaste="return false" maxlength="20"  type="password" placeholder="请输入新密码">
					</li>
					<li class="pop-mainli clearfix">
						<p class="pop-mainlip1 fl">确认新密码：</p>
						<input type="password" class="pwd fl" name="Jpassword3"  datatype="s6-6" autocomplete="off" onpaste="return false" maxlength="6"  type="password" placeholder="请再次输入新密码">
					</li>
				</ul>
			</form>
			<div class="sure" id='JY'></div>
		</div>
	</div>
</div>
<%@ include file="../common/accountfooter.jsp"%>