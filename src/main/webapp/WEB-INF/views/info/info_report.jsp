<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/report.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"page/report"};
</script>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 运营报告 -->
<div id="content">
	<div class="banner">
		<div class="banner1200 clearfix">
			<p class="fl report01"></p>
			<p class="fl report02"></p>
			<p class="fl report03"></p>
		</div> 
	</div>
	<div class="page-cont">
        <h2 class="page-h2"><i class="line-left"></i>平台运营数据<i class="line-right"></i></h2>
		<p class="page-p"><span class="page-p2">数据截止至：</span><span class="page-p1">--</span></p>
    </div>
    <div class="totaldata">
        <span>
            <i>累计交易额</i>
            <em class="counter counter1 counter">--</em><sub>元</sub>
        </span>
        <span>
            <i>累计收益</i>
            <em class="counter counter2 counter">--</em><sub>元</sub>
        </span>
        <span>
            <i>交易总笔数</i>
            <em class="counter counter3 counter">--</em><sub>笔</sub>
        </span>
        <span>
            <i>投资人总数</i>
            <em class="counter counter4 counter">--</em><sub>人</sub>
        </span>
    </div>
    <div class="echarts">
        <div class="echarts-pie1" id="pie1"></div>
        <div class="echarts-pie2" id="pie2"></div>
        <div class="echarts-pie3" id="pie3"></div>    
    </div>
    <div class="borrowqx">
        <p class="borrowqx01">产品投资期限</p>
        <div class="borrowqx-ul clearfix">
            <div class="borrowqx-ul01 fl">微+系列</div>
            <ul class="borrowqx-ul02 fl" id="bolistww"></ul>
            <ul class="borrowqx-ul03 fl" id="boulww"></ul>
            <div class="borrowqx-sul01 fl">
                <p>微年利</p>
                <p>微月盈</p>
            </div>
            <ul class="borrowqx-ul02 fl" id="bolistwyy"></ul>
            <ul class="borrowqx-ul03 fl" id="boulwyy"></ul>
        </div>
    </div>
    <div class="borrowfb">
        <p class="borrowfb01">投资产品分布</p>
        <div id="fb"></div>
    </div>
    <div class="borrowdata">
    	<div class="borrowdata01"></div>
        <ul class="borrowdataul clearfix">
            <li class="borrowdatali01 fl">
                <p class="borrowdatalip1"><span class="borrowdatalib1 counter">--</span><span>人</span></p>
                <p class="borrowdatalip2">借款人总数</p>
            </li>
            <li class="borrowdatali02 fl">
                <p class="borrowdatalip1"><span class="borrowdatalib2 counter">--</span><span>元</span></p>
                <p class="borrowdatalip2">借款金额</p>
            </li>
            <li class="borrowdatali03 fl">
                <p class="borrowdatalip1 borrowdatalib3">--</p>
                <p class="borrowdatalip2">逾期率</p>
            </li>
        </ul>
    </div>
    <div class="borrowtype">
    	<p class="borrowtype01">借款类型分布</p>
    	<div id="main"></div>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>