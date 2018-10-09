<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</head>
<body>
<!--[if lte IE 8]>
<div id="iedi8"><i></i>您的浏览器版本过低。为保证最佳的体验，<a href="http://www.google.cn/chrome/">请点此更新高版本浏览器</a></div>
<![endif]-->
<div id="header" class="header">
	<div class="header-top">
		<div class="container clearfix">
			<div class="nav-warp ui-left">
				<p class="nav-time">客服热线：400-8878288  （工作时间：9:00-18:00）</p>
			</div>
			<div class="login-warp ui-right">
				<input id="userid" type="hidden" value="${user_id}">
				<input id="ustoken" type="hidden" value="${us_token}">
				<c:if test="${empty userinfo.user_name}">
                    <c:if test="${type != 'index'}">
                        <a class="login-link" href="/index">返回首页</a>
                        <a class="line-link"></a>
                    </c:if>
                    <c:if test="${type != 'login'}">
                        <a class="login-link" onclick="G.goLogin();">登录</a>
                    </c:if>
                    <c:if test="${type == 'login'}">
                        <a class="login-link" href="/user/login">登录</a>
                    </c:if>                
					<a class="line-link"></a>
					<a class="login-link" href="/user/reg">注册</a>
				</c:if>
				<c:if test="${not empty userinfo.user_name}">
					<span class="logout">您好，<a href="/user/account?type=account" target="_self" class="username">${userinfo.user_name}</a>
						<a href="javascript:void(0);" target="_self" class="logOutBtn" onclick="G.Logout();">[退出]</a>
					</span>					 
				</c:if>
			</div>
		</div>
	</div>
	<div class="header-main" id="J_header_main">
		<div class="container clearfix">
			<div class="header-logo ui-left">			
				<a href="/index" class="ui-header-logo"></a>
            </div>
            <c:if test="${type == 'recharge'}">
                <div class="headxian fl"></div>
                <p class="loginwz fl">充值</p>
            </c:if>
            <c:if test="${type == 'kiting'}">
                <div class="headxian fl"></div>
                <p class="loginwz fl">提现</p>
            </c:if>
            <c:if test="${type == 'login'}">
                <div class="headxian fl"></div>
                <p class="loginwz fl">登录</p>
            </c:if>
            <c:if test="${type != 'recharge' && type != 'kiting' && type != 'login'}">
    			<div class="header-nav ui-right">
    				<ul class="nav-items">
    					<c:if test="${userinfo.user_type == '01' || empty userinfo.user_name}">
        					<li class="nav-list ui-left <c:if test="${type == 'index'}">on</c:if>">
        						<a href="/index" class="list-link">首页</a>
        					</li>
        					<li class="nav-list ui-left <c:if test="${type == 'invest'}">on</c:if>">
        						<a href="/invest" class="list-link">我要投资</a>
        						<ul class="nav-dropdown ui-nav-dropdown-invest">
                                   	<li class="nav-dropdown-angle"><span></span></li>
                                    <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/invest/yearlist">微年利</a>
                                    </li>
                                    <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/invest/monthlist">微月盈</a>
                                    </li>
                                    <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/invest/pluslist">微+系列</a>
                                    </li>
                                    <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/invest/scattered">散标</a>
                                    </li>
                                    <!-- <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/invest/transferzone">转让专区</a>
                                    </li> -->
                                </ul>
        					</li>
    					</c:if>
       					<li class="nav-list ui-left <c:if test="${type == 'borrow'}">on</c:if>">
       						<a href="/borrow" class="list-link">我要借款</a>
       					</li>
    					<c:if test="${userinfo.user_type == '01' || empty userinfo.user_name}">
        					<li class="nav-list ui-left <c:if test="${type == 'report'}">on</c:if>">
        						<a href="/report" class="list-link">信息披露</a>
                                <ul class="nav-dropdown ui-nav-dropdown-invest">
                                    <li class="nav-dropdown-angle"><span></span></li>
                                    <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/report">运营报告</a>
                                    </li>
                                    <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/introduce">关于我们</a>
                                    </li>
                                     <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/news">企业动态</a>
                                    </li>
                                    <!--  <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/organizational">管理团队</a>
                                    </li> -->
                                    <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/organizational">组织架构</a>
                                    </li>
                                    <!-- <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/chronice">大事记</a>
                                    </li>  -->
                                     <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/fengkong">风险控制</a>
                                    </li>
                                    <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/certificate">资质证书</a>
                                    </li>
                                    <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/partner">合作伙伴</a>
                                    </li>
                                     <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/contactus">联系我们</a>
                                    </li>
                                    <!-- <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/rates">收费标准</a>
                                    </li> -->
                                    <li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/partner">合作伙伴</a>
                                    </li>
                                    <!--<li class="nav-dropdown-item">
                                        <a class="dropdown-item-a" href="/coverage">媒体报道</a>
                                    </li> -->
                                </ul>
        					</li>
    					</c:if>
    					<li class="nav-list ui-left <c:if test="${type == 'account'}">on</c:if>">
    						<a href="/user/account" class="list-link">我的账户</a>
    					</li>
    				</ul>
    			</div>
            </c:if>
		</div>
	</div>
</div>

