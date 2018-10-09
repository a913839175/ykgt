<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_account.css?v=${version}" />
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_claim.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"page/bo_myborrow"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 我的借款 -->
<div id="content">
    <div class="cont1200 clearfix">
        <%@ include file="borrower_menu.jsp"%>
        <div class="contentright yellow fl">
            <h2 class="conttile">我的借款</h2>

            <div class="page-tab-nav yellow">
                <p class="tab-nav-item active">未还款</p>
                <p class="tab-nav-item">申请借款中</p>
                <p class="tab-nav-item">已还款</p>
            </div>


            <div class="page-tab-cont">
                <ul class="tab-nav-content" id="myinvestList">
                    <div class="trade_null {{lists.length}}" >
                        <img alt="暂无数据" class="pic-nodata" src="${cdnServer}/static/weipaidai/images/pic-nodata.png">
                    </div>
                </ul>
            </div>

            <div class="contpage">
                <div class="M-box"></div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/accountfooter.jsp"%>