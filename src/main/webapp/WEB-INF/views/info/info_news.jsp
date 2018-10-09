<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/news.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"page/news"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 动态与公告 -->
<div id="content">
    <div class="cont1200 clearfix">
        <%@ include file="../common/sidebar.jsp"%>
        <div class="contentright">
            <img src="${cdnServer}/static/weipaidai/images/disclosure/disclosure02.png">
            <div class="news-cont">
                <p class="news-tab">
                    <a class="news-tab-a on" href="javascript:void(0);">最新动态</a>
                    <a class="news-tab-a" href="javascript:void(0);">网站公告</a>
                </p>
                <ul class="newsList">

                </ul>
                <!-- 分页 -->
                <div class="page">
                    <div class="M-box"></div>
                </div>       
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>