<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_account.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"page/bo_account"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 我的账户 -->
<div id="content">
    <div class="cont1200 clearfix" style="height: 1260px;">
        <%@ include file="borrower_menu.jsp"%>
        <div class="contentright yellow fl">
            <div class="totalMain">
                <div class="toalData aBalance">
                    <p>总金额（元）<a href="javascript:void(0);" class="eyes <c:if test='${usermain.display_status == 2}'>on</c:if>" id="hidden_toggle"></a></p>
                    <c:if test="${usermain.display_status != 2}">
                        <p id="availablebalance" class="num" data-title="${usermain.total}">${usermain.total}</p>
                    </c:if>
                    <c:if test="${usermain.display_status == 2}">
                        <p class="num" data-title="${usermain.total}">*****</p>
                    </c:if>
                </div>
                <div class="toalData aBalance1">
                    <p>可用余额（元）</p>
                    <c:if test="${usermain.display_status != 2}">
                        <p class="num" data-title="${usermain.balance}">${usermain.balance}</p>
                    </c:if>
                    <c:if test="${usermain.display_status == 2}">
                        <p class="num" data-title="${usermain.balance}">*****</p>
                    </c:if>
                </div>
                <div class="toalData aBalance1">
                    <p>冻结金额（元）</p>
                    <c:if test="${usermain.display_status != 2}">
                        <p class="num" data-title="${usermain.frozen_account}">${usermain.frozen_account}</p>
                    </c:if>
                    <c:if test="${usermain.display_status == 2}">
                        <p class="num" data-title="${usermain.frozen_account}">*****</p>
                    </c:if>
                </div>
            
                <a href="javascript:void(0);" class="a-btn a-btn-1" id="recharge">充值</a>
                <a href="javascript:void(0);" class="a-btn a-btn-2" id="withdrawNow">提现</a>
            </div>
            <div class="content-bg"></div>
            <div class="content-record">
                <div class="content-r clearfix">
                    <h3 class="title fl">还款记录</h3>
                </div>
                <div class="record-box">
                    <div class="record-table">
                        <div class="hd clearfix">
                            <p class="w25 fl">还款单号</p>
                            <p class="w15 fl">还款日</p>
                            <p class="w15 fl">总期数</p>
                            <p class="w15 fl">当前期数</p>
                            <p class="w15 fl">还款金额</p>
                            <p class="w15 fl">还款状态</p>
                        </div>
                        <div class="record-list" id="FinishedRepayList">

                        </div>
                    </div>
                </div>
                <!-- 分页 -->
                <div class="contpage">
                    <div class="M-box2"></div>
                </div>
                <input type="hidden" class="bdnum" value="">
            </div>
            <div class="content-record">
                <div class="content-r clearfix">
                    <h3 class="title fl">充值提现记录</h3>
                    <div class="content-right fr">
                        <div class="rsd-time-title fl">起止日期：</div>
                        <div class="quick-input-date fl">
                            <input type="text" id="start_time" class="date-search-input" value="" readonly="">
                            <span class="separator-pd">-</span>
                            <input type="text" id="end_time" class="date-search-input" value="" readonly="">
                        </div>
                    </div>
                </div>
                <div class="record-box">
                    <div class="record-table">
                        <div class="hd clearfix">
                            <div class="sort sp sp1 clearfix">
                                <p class="sp1mz1 fl">时间</p>
                                <p class="sp1img1 fl"></p>
                            </div>
                            <p class="sp sp2">操作类型</p>
                            <p class="sp sp3">操作说明</p>
                            <div class="sort sp sp4 clearfix">
                                <p class="sp1mz2 fl">金额(元)</p>
                                <p class="sp1img1 fl"></p>
                            </div>
                            <p class="sp sp5">交易后可用金额</p>
                            <p class="sp sp6">单号</p>
                        </div>
                        <div class="record-list" id="recordList">

                        </div>
                    </div>
                </div>
                <!-- 分页 -->
                <div class="contpage">
                    <div class="M-box"></div>
                </div>
                <input type="hidden" class="bdnum" value="">
            </div>
        </div>  
    </div>
</div>
<%@ include file="../common/accountfooter.jsp"%>