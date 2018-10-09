<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_account.css?v=${version}" />
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_invite.css?v=${version}" />
<script type="text/javascript">
	var OP_CONFIG={"page":"page/user_invite"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 邀请好友 -->
<div id="content">
	<div class="cont1200 clearfix">
		<%@ include file="user_menu.jsp"%>
		<div class="contentright fl">
			<h2 class="conttile">邀请好友</h2>
			<div class="invitefriend">
				<ul class="friendul clearfix">
					<li class="friendli fl friendliactive">好友投资详情</li>
					<li class="friendli fl">累计邀请人数</li>
				</ul>
				<div class="fcontent">
					<div class="tableclass table0 clearfix	">
						<ul class="tablehead clearfix fr">
							<p class="fl tablehead01">姓名：</p>
							<input type="text" class="fl tablehead02">
							<p class="fl tablehead03">手机号码：</p>
							<input type="text" maxlength='11' class="fl tablehead04">
							<p class="fl tablehead05">投资时间：</p>
							<input type="text" class="fl tablehead06" id="start_time" readonly>
							<p  class="fl tablehead07"></p>
							<input type="text" class="fl tablehead08" id="end_time" readonly>
							<button class="fl tablehead09">查询</button>
						</ul>
						<table id="friendtz">
							<input type="hidden" class="bdtotal">
							<thead>
								<tr>
									<th width="18%">手机号码</th>
									<th width="10%">姓名</th>
									<th width="18%">产品名称</th>
									<th width="18%">投资金额</th>
									<th width="18%">投资时间</th>
									<th width="18%">赎回时间</th>
								</tr>
							</thead>
							<tbody id="friendtbody">
								
							</tbody>
						</table>
						<div class="page">
							<div class="M-box1"></div>
						</div>
					</div>
					<div class="tableclass table1 clearfix	">
						<ul class="tablehead2 clearfix fr">
							<p class="fl tablehead10">时间：</p>
							<input type="text" class="fl tablehead11" id="start_time2">
							<p  class="fl tablehead07"></p>
							<input type="text" class="fl tablehead12" id="end_time2">
							<button class="fl tablehead99">查询</button>
						</ul>
						<table id="friendyq">
							<input type="hidden" class="bdtotal2">
							<thead>
								<tr>
									<th width="33%">手机号码</th>
									<th width="33%">姓名</th>
									<th width="33%">推荐时间</th>
								</tr>
							</thead>
							<tbody id="friendtbody2">
								
							</tbody>
						</table>
						<div class="page">
							<div class="M-box2"></div>
						</div>
					</div>
				</div>
			</div>
			<h2 class="invite-title">邀请奖励</h2>
				<img src="${cdnServer}/static/weipaidai/images/invite_banner.jpg?v=20180703" class="invite-award">
			<h2 class="invite-title">邀请方式</h2>
			<div class="invite-methods">
				<div class="methods-left fl">
					<p class="methods-title">邀请方式一：将您的邀请专属链接发送给您的好友</p>
					<input class="methods-input" id="copyUrl" value="${inviteUrl}" readonly>
					<button class="methods-button copy-btn" data-clipboard-action="copy" data-clipboard-target="#copyUrl">复制链接</button>
					<p class="methods-share">邀请方式三：分享至<span id="J-share"></span></p>
				</div>
				<div class="methods-right fl">
					<p class="methods-title">邀请方式二：用手机扫描二维码分享给好友</p>
					<p class="methods-images"><img id="Imagewm" src="${ORcodeUrl}" ></p>
				</div>
			</div>
			<h2 class="invite-title">邀请流程</h2>
			<div class="invite-flow">
				<span class="flow-span1">分享链接好友</span>
				<span class="flow-span2">好友注册并理财</span>
				<span class="flow-span3">获得奖励</span>
			</div>
		</div>
	</div>
</div>

<%@ include file="../common/accountfooter.jsp"%>