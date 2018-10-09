<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/invest.css?v=${version}" />
<script type="text/javascript">
	var OP_CONFIG={"page":"page/invest"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 我要投资 -->
<div id="content">
	
	<!-- banner图 -->
	<div class="page-banner"></div>
	<div class="page-tab">
		<ul class="navs-ul">
			<li class="navs-list <c:if test="${type == 'all'}">active</c:if>"><a href="/invest">全部项目</a></li>
			<li class="navs-list <c:if test="${type == 'yearlist'}">active</c:if>"><a href="/invest/yearlist">微年利</a></li>
			<li class="navs-list <c:if test="${type == 'monthlist'}">active</c:if>"><a href="/invest/monthlist">微月盈</a></li>
			<li class="navs-list <c:if test="${type == 'pluslist'}">active</c:if>"><a href="/invest/pluslist">微+系列</a></li>
			<li class="navs-list <c:if test="${type == 'scattered'}">active</c:if>"><a href="/invest/scattered">散标</a></li>
			<!-- <li class="navs-list <c:if test="${type == 'transferzone'}">active</c:if>"><a href="/invest/transferzone">转让专区</a></li> -->
		</ul>
	</div>	
	<!-- 全部标的 -->
	<div class="allobject">
		<div class="allobjbox">
			<div class="allobjectc">
				<div class="allobjectchead">
					<ul class="allobjecul clearfix">
						<li class="allobjecli1 clearfix fl allobjecli">
							<p class="allobjeclims1 fl">预期利率</p>
							<p class="allobjecliimg1 fr"></p>
						</li>
						<li class="allobjecli2 clearfix fl mal122 allobjecli">
							<p class="allobjeclims1 fl">项目期限</p>
							<p class="allobjecliimg1 fr"></p>
						</li>
						<li class="allobjecli2 clearfix fl mal114 allobjecli">
							<p class="allobjeclims1 fl">还款方式</p>
						</li>
						<li class="allobjecli2 clearfix fl mal119 allobjecli">
							<p class="allobjeclims1 fl">项目进度</p>
							<p class="allobjecliimg1 fr"></p>
						</li>
						<li class="allobjecli2 clearfix fl mal229 allobjecli">
							<p class="allobjeclims1 fl">可投金额</p>
							<p class="allobjecliimg1 fr"></p>
						</li>
					</ul>
				</div>
				<!-- 微年利1年期 -->
				<div class="investcp">
					<ul class="investcpul" id="investcpul">						
					
					</ul>
				</div>
			</div>	
		</div>
		<!-- 分页 -->
		<div class="page">
			<div class="M-box"></div>
		</div>
		<c:if test="${type == 'all'}">
			<input type="hidden" class="stype" value="all">
		</c:if>
		<c:if test="${type == 'yearlist'}">
			<input type="hidden" class="stype" value="wyl">
		</c:if>
		<c:if test="${type == 'monthlist'}">
			<input type="hidden" class="stype" value="wyy">
		</c:if>
		<c:if test="${type == 'pluslist'}">
			<input type="hidden" class="stype" value="ww">
		</c:if>
		<c:if test="${type == 'scattered'}">
			<input type="hidden" class="stype" value="sds">
		</c:if>
	</div>
</div>
<%@ include file="../common/footer.jsp"%>

