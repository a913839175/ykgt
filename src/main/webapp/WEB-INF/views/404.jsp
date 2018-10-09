<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/error.css?v=20170907" />
<script type="text/javascript">
	var OP_CONFIG={"page":""};
</script>
<%@ include file="common/header.jsp"%>

<div id="content"> 
   	<div class="error404 <c:if test="${statusCode == 500}">error500</c:if>">
        <div class="w990">
            <a href="/index" class="error-a"></a>
        </div>  
   	</div>
</div>
<%@ include file="common/footer.jsp"%>