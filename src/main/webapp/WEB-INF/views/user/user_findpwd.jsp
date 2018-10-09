<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/findpwd.css?v=${version}" />
<script type="text/javascript">
	var OP_CONFIG={"page":"page/forget"};
</script>	
</head>
<body>
<!--[if lte IE 8]>
<div id="iedi8">	
	<p><i></i>您的浏览器版本过低。为保证最佳的体验，<a href="http://www.google.cn/chrome/">请点此更新高版本浏览器</a></p>
</div>
<![endif]-->
<div id="header">
	<div class="header-top">
		<div class="container clearfix">
			<div class="nav-warp ui-left">
				<p class="nav-time">客服热线：400-8878288  （工作时间：9:00-18:00）</p>
			</div>
			<div class="login-warp ui-right">
				<a class="login-link" href="/index">返回首页</a>
				<a class="line-link"></a>
				<a class="login-link" href="/user/login">登录</a>
				<a class="line-link"></a>
				<a class="login-link" href="/user/reg">注册</a>
			</div>
		</div>
	</div>
	<div class="header-main-login">
		<div class="container clearfix">
			<div class="header-logo fl">
				<a href="/index" class="ui-header-logo"></a>
			</div>
			<div class="headxian fl"></div>
			<p class="loginwz fl">忘记密码</p>
		</div>
	</div>
</div>
<div class="content">
	<div class="yash" >
		<p class="yash01">验证身份</p>
		<div class="yash02 clearfix">
			<img src="${cdnServer}/static/weipaidai/images/safety03.png" class="yashimg1 fl">
			<p class="yash03 fl">温馨提示：请输入手机号，找回密码</p>
		</div>
		<div class="ffxian"></div>
		<div class="fselect clearfix">
            <label class="login-reg"><i class="login-acctpu"></i></label>
            <div id="myselect" class="select" data-value="01">
                <p class="select-option">我是投资人</p>
                <div class="select-selectbtn"></div>
                <ul class="select-ul">
                    <li class="select-list is-select" data-value="01">我是投资人</li>
                    <li class="select-list" data-value="02">我是借款人</li>
                </ul>
            </div> 
        </div>	
		<div class="phonename clearfix">
			<img src="${cdnServer}/static/weipaidai/images/forgetp01.png" class="yashimg2 fl">
			<input type="text" class="yash04 fl" ajaxurl="/api/checkUsername" datatype="m" errormsg="手机号码格式错误" sucmsg=" " nullmsg="手机号码不能为空" maxlength="11" placeholder="请输入手机号码">
		</div>
		<div class="yanzhengma clearfix">
			<input type="text" class="yash05 fl" datatype="*" errormsg="手机验证码错误"  sucmsg=" " nullmsg="请输入手机验证码" maxlength="6" placeholder="请输入手机验证码">
			<button class="yash06 fl">获取短信验证码</button>
		</div>	
		<button class="yash08" id="btn_findPwd">确  认</button>
	</div>
	<div class="yash2" style="display: none;">
		<p class="yash01">验证身份</p>
		<div class="yash02 clearfix">
			<img src="${cdnServer}/static/weipaidai/images/safety03.png" class="yashimg1 fl">
			<p class="yash03 fl">温馨提示：请正确输入新密码</p>
		</div>
		<div class="ffxian"></div>
		<div class="newpassword clearfix">
			<p>新的登录密码：</p>
			<input id="password" class="login-input" name="password" datatype="s6-20" sucmsg="&nbsp;" errormsg="密码要求6-20位字符" nullmsg="登录密码不能为空"  autocomplete="off" onpaste="return false" maxlength="20" type="password" placeholder="请输入新的登录密码">
			<span class="Validform_checktip"></span>
		</div>
		<div class="newpassword2 clearfix">
			<p>确认密码：</p>
			<input id="repassword" class="login-input"  name="repassword" datatype="s6-20" recheck="password" sucmsg="&nbsp;" errormsg="两次输入的内容不一致"  nullmsg="确认密码不能为空" autocomplete="off" onpaste="return false" maxlength="20" type="password" placeholder="请再次新的登录密码">
			<span class="Validform_checktip"></span>
		</div>
		<button class="yash09">确  认</button>
	</div>
	<div class="yash3" style="display: none;">
		<p class="yash301">恭喜您，密码修改成功！</p>
		<img src="${cdnServer}/static/weipaidai/images/forgetp05.png" class="yash302">
		<a  class="yash303" href="/user/login">马上登录</a>
	</div>
</div>
<%@ include file="../common/accountfooter.jsp"%>
