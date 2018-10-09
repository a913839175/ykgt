<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/mall_meta.jsp"%>
<link rel="stylesheet" type="text/css" href="/static/weipaidai/css/mall/orderlist.css?v=${version}">
<script type="text/javascript">
    var OP_CONFIG={"page":"mall/orderlist"};
</script>
<%@ include file="../common/mall_header.jsp"%>
<!-- 兑换记录 -->
<div id="content">
    <div class="maincontent">
        <div class="breaditem">
            <ul class="breadcrumb">
                <li><a href="/mall">首页</a><i>></i></li>
                <li><a href="javascript:void(0);">兑换记录</a></li>
            </ul>
        </div>
        <div class="record-cont">
            <div class="record-thead">
                <span class="th-span1">宝贝</span>
                <span class="th-span2">数量</span>
                <span class="th-span2">实付微币</span>
                <span>订单状态</span>
            </div>
            <div class="record-tbody">
                <ul class="record-item" id="recordList">
                    
                </ul>
                <div class="page">
                    <div class="M-box"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>