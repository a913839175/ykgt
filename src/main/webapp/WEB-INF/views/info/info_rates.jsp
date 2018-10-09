<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/rates.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"page/rates"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 收费标准 -->
<div id="content">
    <div class="cont1200 clearfix">
        <%@ include file="../common/sidebar.jsp"%>
        <div class="contentright">
            <img src="${cdnServer}/static/weipaidai/images/disclosure/disclosure08.png">
            <table>
                <tr class="t1">
                    <td colspan="2">业务类型</td>
                    <td>业务类型</td>
                </tr>
                <tr class="t1">
                    <td colspan="2">用户注册</td>
                    <td>免费</td>
                </tr>
                <tr class="t1">
                    <td colspan="2">开通存管账号</td>
                    <td>免费</td>
                </tr>
                <tr class="t2">
                    <td rowspan="4">投标</td>
                    <td>微年利</td>
                    <td>免费</td>
                </tr>
                <tr class="t3">
                    <td>微月盈</td>
                    <td>免费</td>
                </tr>
                <tr class="t3">
                    <td>微+</td>
                    <td>免费</td>
                </tr>
                <tr class="t3">
                    <td>微+宝</td>
                    <td>免费</td>
                </tr>
                <tr class="t1">
                    <td colspan="2">回款到账</td>
                    <td>免费</td>
                </tr>
                <tr class="t1">
                    <td colspan="2">充值</td>
                    <td>免费</td>
                </tr>
                <tr class="t1">
                    <td colspan="2">提现</td>
                    <td>免费</td>
                </tr>
            </table>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>