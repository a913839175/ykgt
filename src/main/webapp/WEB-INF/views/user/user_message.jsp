<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_account.css?v=${version}" />
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_message.css?v=${version}" />
<script type="text/javascript">
	var OP_CONFIG={"page":"page/user_message"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 消息管理 -->
<div id="content">
	<div class="cont1200 clearfix">
		<%@ include file="user_menu.jsp"%>
		<div class="contentright fl">
			<h2 class="conttile">消息管理</h2>
			
			<div class="message-box">

			</div>	
			<div class="contpage">
				<div class="M-box"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/accountfooter.jsp"%>