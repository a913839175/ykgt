<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_account.css?v=${version}" />
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_hongbao.css?v=${version}" />
<script type="text/javascript">
	var OP_CONFIG={"page":"page/use_hongbao"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 未使用红包 -->
<div id="content">
	<div class="cont1200 clearfix">
		<%@ include file="user_menu.jsp"%>
		<div class="contentright fl">
			<input type="hidden" class="realname_flag">
			<h2 class="conttile">我的红包</h2>
			<!-- 红包收益区块 -->
			<ul class="hbshouyi_ul clearfix">
				<li class="hbshouyi_li fl">
					<p class="hbshouyi_p1">红包总收益</p>
					<p class="hbshouyi_p2">￥<span class="hbshouyi_span1"></span></p>
				</li>
				<p class="hbshouyi_p3 fl">=</p>
				<li class="hbshouyi_li fl">
					<p class="hbshouyi_p1">现金红包</p>
					<p class="hbshouyi_p2">￥<span class="hbshouyi_span2"></span></p>
				</li>
				<p class="hbshouyi_p3 fl">+</p>
				<li class="hbshouyi_li fl">
					<p class="hbshouyi_p1">投资红包</p>
					<p class="hbshouyi_p2">￥<span class="hbshouyi_span3"></span></p>
				</li>
				<p class="hbshouyi_p3 fl">+</p>
				<li class="hbshouyi_li fl">
					<p class="hbshouyi_p1">加息红包</p>
					<p class="hbshouyi_p2">￥<span class="hbshouyi_span4"></span></p>
				</li>
			</ul>
			<!-- 使用状态 -->
			<ul class="hb_type clearfix">
				<li class="active">未使用</li>
				<li>已使用</li>
				<li>已过期</li>
			</ul>
			<!--红包 -->
			<ul class="hb_ul clearfix hb_ul0" id="hbList">

			</ul>
			<!-- 分页 -->
			<div class="hongbaopage">
				<div class="M-box"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/accountfooter.jsp"%>