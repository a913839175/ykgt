<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/newsdetail.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":""};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 动态与公告 -->
<div id="content">
    <div class="cont1200 clearfix">
        <%@ include file="../common/sidebar.jsp"%>
        <div class="contentright">
            <div class="about_back"><a href="/${type}">&lt;&lt;返回</a></div>
            <div class="article">
                <h2 class="article-title">${getSiteResult.title}</h2>
                <p class="article-time">发布时间：${getSiteResult.updatetime}</p>
                <div class="article-cont">${content}</div>
            </div>         
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>