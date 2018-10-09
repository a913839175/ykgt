<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_account.css?v=${version}" />
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_claim.css?v=${version}" />
<script type="text/javascript">
	var OP_CONFIG={"page":"page/user_claim"};
	var getIpAddr = "${ip}";
</script>
<%@ include file="../common/header.jsp"%>
<!-- 历史回款 -->
<div id="content">
	<div class="cont1200 clearfix">
		<%@ include file="user_menu.jsp"%>
		<div class="contentright fl">
			<h2 class="conttile">历史债权</h2>
			<ul class="hbshouyi_ul clearfix">
				<li class="hbshouyi_li fl">
					<p class="hbshouyi_p1">未赎回总额</p>
					<p class="hbshouyi_p2 hbshouyi_p4">￥<span class="hbshouyi_span1">${old_account.account}</span></p>
				</li>
				<p class="hbshouyi_p3 fl">=</p>
				<li class="hbshouyi_li fl">
					<p class="hbshouyi_p1">申请中的金额</p>
					<p class="hbshouyi_p2">￥<span class="hbshouyi_span2">${old_account.apple_account}</span></p>
				</li>
				<p class="hbshouyi_p3 fl">+</p>
				<li class="hbshouyi_li fl">
					<p class="hbshouyi_p1">可赎回金额</p>
					<p class="hbshouyi_p2">￥<span class="hbshouyi_span3" id="expire_account">${old_account.expire_account}</span></p>
				</li>
				<p class="hbshouyi_p3 fl">+</p>
				<li class="hbshouyi_li fl">
					<p class="hbshouyi_p1">待赎回金额</p>
					<p class="hbshouyi_p2">￥<span class="hbshouyi_span4">${old_account.await_account}</span></p>
				</li>
				<div class="hbshouyi_p5 fl">
					<div class="hbshouyi_p6" data-id="${old_account.tender_id}">全部赎回</div>
					<div class="hbshouyi_p7 clearfix">
						<a href="javascript:void(0)" class="hbshouyi_p8 fl" id="dqhkBtn">到期回款</a>
						<p class="hbshouyi_p9 fl"></p>
						<a href="javascript:void(0)" class="hbshouyi_p10 fr" id="shjlBtn">赎回记录</a>
					</div>
				</div>
			</ul>
			<div class="page-tab-nav">
				<p class="tab-nav-item active">收益中的项目</p>
				<p class="tab-nav-item">已结算的项目</p>
			</div>
			<div class="page-tab-cont">
				<ul class="tab-nav-content" id="hisrecordList">
				</ul>
			</div>

			<div class="contpage">
				<div class="M-box"></div>
			</div>
		</div>
	</div>
</div>
<div class="mask" id="maxje1">
	<div class="redmoney01">
		<div class="redmoney02"></div>
		<div class="redmoney03 clearfix">
			<p class="redmoney03_01 fl">可赎回金额：</p>
			<p class="redmoney03_02 fl">${old_account.expire_account}元</p>
		</div>
		<div class="redmoney04 clearfix">
			<p class="redmoney04_01 fl">手机号：</p>
			<input type="text" class="redmoney04_02 fl" disabled="true"  id="shphone" value="${userinfo.user_name}">
		</div>
		<div class="redmoney05 clearfix">
			<p class="redmoney05_01 fl">验证码：</p>
			<input type="text" class="redmoney05_02 fl" placeholder="请输入手机动态码" maxlength="6" id="smsInput">
			<button class="redmoney05_03 fl" id="smscode">获取动态码</button>
		</div>
		<button class="sruesh">确认赎回</button>
	</div>
</div>
<div class="mask" id="maxje2">
	<div class="redmoneyx01">
		<h3 class="pop-title">到期回款<span class="pop-close" id="pop_box_close"></span></h3>
		<div class="redmoneyx02"></div>
		<table class="expiretab">
			<thead>
	            <tr>
		            <td>产品名称</td>
					<td>金额(元)</td>
					<td>时间</td>
					<td>状态</td>
	            </tr>
	        </thead>
	        <tbody id="expiretbody" class="pop-table">
							
            </tbody>
		</table>
		<div class="contpage" style="width: 100%;">
			<div class="M-box2"></div>
		</div>
	</div>
</div>
<div class="mask" id="maxje3">
	<div class="redmoneyx01">
		<h3 class="pop-title">赎回记录<span class="pop-close" id="pop_box_close"></span></h3>
		<div class="redmoneyx02"></div>
		<table class="expiretab">
			<thead>
	            <tr>
		            <td>赎回时间</td>
					<td>赎回金额(元)</td>
					<td>类型</td>
					<td>状态</td>
	            </tr>
	        </thead>
	        <tbody id="oldredeemList" class="pop-table">
							
            </tbody>
		</table>
		<div class="contpage" style="width: 100%;">
			<div class="M-box3"></div>
		</div>
	</div>
</div> 
<%@ include file="../common/accountfooter.jsp"%>