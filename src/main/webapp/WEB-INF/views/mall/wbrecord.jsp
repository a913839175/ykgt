<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/mall_meta.jsp"%>
<link rel="stylesheet" href="/static/weipaidai/css/mall/wbrecord.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"mall/wbrecord"};
</script>
<%@ include file="../common/mall_header.jsp"%>
<!-- 微币记录 -->
<div id="content">
    <div class="maincontent">
        <p class="protitle"><a href="/mall" class="index">首页</a> > 微币记录</p>       
    </div>
    <div class="contantz">
        <div class="contantwz">
            <p class="dqwb">您当前微币：<span><c:if test="${currency.credit > 0}">${currency.credit}</c:if><c:if test="${currency.credit <= 0}">0</c:if></span></p>
            <div class="tecontantz">
                <ul class="tecontant_ul clearfix">
                    <li class="tecontant_li tecontant_liactive">微币收入</li>
                    <li class="tecontant_li">微币支出</li>
                </ul>
            </div>
            <table id="wbtable">
                <thead>
                    <tr>
                        <th>日期</th>
                        <th>类型</th>
                        <th>微币</th>
                    </tr>
                </thead>
                <tbody id="wbtbody">
                    
                </tbody>
            </table>
            <div class="page2">
                <div class="M-box M-box1">
                    
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>