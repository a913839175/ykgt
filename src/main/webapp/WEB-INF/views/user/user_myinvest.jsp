<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_account.css?v=${version}" />
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_claim.css?v=${version}" />
<script type="text/javascript">
	var OP_CONFIG={"page":"page/user_myinvest"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 历史债权 -->
<div id="content">
	<div class="cont1200 clearfix">
		<%@ include file="user_menu.jsp"%>
		<div class="contentright fl">
			<h2 class="conttile">我的投资</h2>
	
			<div class="page-tab-nav">
				<p class="tab-nav-item active">申请中的项目</p>
				<p class="tab-nav-item">收益中的项目</p>
				<p class="tab-nav-item">已结算的项目</p>
			</div>


			<div class="page-tab-cont">
				<ul class="tab-nav-content" id="myinvestList">

				</ul>
			</div>

			<div class="contpage">
				<div class="M-box"></div>
			</div>
		</div>
	</div>
</div>
<div class="mask" id="J_myinvest_box">
	<div class="pop_myinvest">
		<h3 class="pop-title">产品投资详情<span class="pop-close" id="pop_box_close"></span></h3>
		<div class="pop-scroll">
		<div class="pop-main pop-list">
			<div class="pop-table-header">
				<p class="pop-table-th w1">标的编号</p>
				<p class="pop-table-th w2">借款人</p>
				<p class="pop-table-th w3">合同</p>
				<p class="pop-table-th w4">投资金额</p>
			</div>
			<div class="pop-table-tobdy" id="poptdList">
				
			</div>
		</div>
		</div>
	</div>
</div>
<%@ include file="../common/accountfooter.jsp"%>