<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</head>
<body>
<!--[if lte IE 8]>
<div id="iedi8"><i></i>您的浏览器版本过低。为保证最佳的体验，<a href="http://www.google.cn/chrome/">请点此更新高版本浏览器</a></div>
<![endif]-->
<div id="header" class="header">
	<div class="header-top">
		<div class="container clearfix">
			<div class="nav-warp fl">
				<p class="nav-time">客服热线：400-8878288  （工作时间：9:00-18:00）</p>
			</div>
			<div class="login-warp fr">
				<input id="userid" type="hidden" value="${user_id}">
				<input id="ustoken" type="hidden" value="${us_token}">
				<c:if test="${empty userinfo.user_name}">
					<a class="login-link" href="/index">返回首页</a>
					<a class="line-link"></a>
					<a class="login-link" href="javascript:void(0);" onclick="G.goLogin();">登录</a>
					<a class="line-link"></a>
					<a class="login-link" href="/user/reg">注册</a>
				</c:if>
				<c:if test="${not empty userinfo.user_name}">
					<a class="login-link" href="/index">返回首页</a>
					<a class="line-link"></a>
					<span class="logout">您好，<a href="/user/account?type=account" target="_self" class="username">${userinfo.user_name}</a>
						<a href="javascript:void(0);" target="_self" class="logOutBtn" onclick="G.Logout();">[退出]</a>
					</span>					 
				</c:if>
			</div>
		</div>
	</div>
	<div class="header-mall">
		<div class="container clearfix">
			<div class="header-logo fl">
				<a href="/mall" class="header-mall-logo"></a>
			</div>
			<div class="header-search fr hide">
				<div class="search-top clearfix">
					<input class="header-search-input fl" type="text" placeholder="搜索兑换产品">
					<div class="search-button fr"><i></i></div>
				</div>		
				<div class="search-hots-fline">
					<!-- <span>热门搜索：</span> -->
					<span class="hotList">

					</span>
				</div>			
			</div>
		</div>
	</div>
</div>