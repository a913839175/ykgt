<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_account.css?v=${version}" />
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_checkbank.css?v=${version}" />
<script type="text/javascript">
	var OP_CONFIG={"page":"page/user_checkbank"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 安全中心 -->
<div id="content">
	<div class="cont1200 clearfix">		
		<c:if test="${userinfo.user_type == '01'}">
			<%@ include file="user_menu.jsp"%>
		</c:if>
		<c:if test="${userinfo.user_type == '02'}">
			<%@ include file="../borrower/borrower_menu.jsp"%>
		</c:if>
		<div class="contentright fl">
			<h2 class="conttile">银行卡</h2>
			<div class="bankbj">
				<div class="bankcardbj">
					<img data-src="" class="bankimg">
					<p class="bankcred">银行卡号</p>
					<p class="bankid">
						<span>****</span><span class="pal11">****</span><span class="pal11">****</span><span class="pal11 cardno"></span>
					</p>
					
				</div>
				<p class="bankms01 pat10">依据银行相关政策条例，每人仅限绑定一张银行卡信息</p>
				<p class="bankms01">如果需要更改绑定银行卡，请联系客服：<span class="bankms02">400-887-8288</span></p>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/accountfooter.jsp"%>