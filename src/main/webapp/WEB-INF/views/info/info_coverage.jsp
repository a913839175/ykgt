<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/coverage.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"page/coverage"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 媒体报道 -->
<div id="content">
    <div class="cont1200 clearfix">
        <%@ include file="../common/sidebar.jsp"%>
        <div class="contentright">
            <img src="${cdnServer}/static/weipaidai/images/disclosure/disclosure10.png">
            <div class="ul-items">
                <c:forEach var="items" items="${getAllMedia.lists}" varStatus="status" begin="0" end="4">
                <div class="items${status.index} lists-items">
                    <a class="list-img" href="/coverage/detail/${items.id}">
                        <img src="${picurl}${items.thumb}">
                    </a>
                    <div class="list-cont">
                        <p class="list-title">${items.title}</p>
                        <p class="list-desc">${wpd:htmlUnescape(items.content)}</p>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>