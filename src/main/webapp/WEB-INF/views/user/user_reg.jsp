<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/userreg.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG= {"page":"page/userreg"};
    var getIpAddr = "${ip}";
</script>  
</head>
<body style="position: relative;">
<!--[if lte IE 8]>
<div id="iedi8"><i></i>您的浏览器版本过低。为保证最佳的体验，<a href="http://www.google.cn/chrome/">请点此更新高版本浏览器</a></div>
<![endif]-->
<div id="header">
	<div class="header-top">
		<div class="container clearfix">
			<div class="nav-warp ui-left">
				<p class="nav-time">客服热线：400-8878288  （工作时间：9:00-18:00）</p>
			</div>
			<div class="login-warp ui-right">			
				<input id="userid" type="hidden" value="${user_id}">
				<input id="ustoken" type="hidden" value="${us_token}">
				<c:if test="${empty userinfo.user_name}">
					<a class="login-link" href="/index">返回首页</a>
					<a class="line-link"></a>
					<a class="login-link" href="/user/login">登录</a>
					<a class="line-link"></a>
					<a class="login-link" href="/user/reg">注册</a>
				</c:if>
				<c:if test="${not empty userinfo.user_name}">
					<span class="logout">您好，
						<a href="/user/account?type=account" target="_self" class="username">${userinfo.user_name}</a>
						<a href="javascript:void(0);" target="_self" class="logOutBtn" id="logOutBtn" onclick="G.Logout();">[退出]</a>
					</span>					 
				</c:if>
			</div>
		</div>
	</div>
</div>
<div id="reg">
	<div class="reg-top">
		<a <c:if test="${userinfo.user_type == '01' || empty userinfo.user_name}"> href="/index" </c:if> class="header-logo">
			<img src="${cdnServer}/static/weipaidai/images/logo.png">
		</a>
	</div>	
	<div class="reg-gologin"><c:if test="${empty userinfo.user_name}">已有账号？<a href="/user/login" class="">立即登录</a></c:if></div>	
	<c:if test="${type == 'account' || type == null}">
    	<div class="reg-box warp1">
    		<div class="reg-step">
                <ol class="ui-step clearfix">
                    <li class="ui-step-start active">
                        <div class="ui-step-line">-</div>
                        <div class="ui-step-icon">
                            <i class="iconfont"></i>
                            <i class="ui-step-number">1</i>
                            <span class="ui-step-text">填写注册资料</span>
                        </div>
                    </li>
                    <li>
                        <div class="ui-step-line">-</div>
                        <div class="ui-step-icon">
                            <i class="iconfont"></i>
                            <i class="ui-step-number">2</i>
                            <span class="ui-step-text">实名信息</span>
                        </div>
                    </li>
                    <li class="ui-step-end">
                        <div class="ui-step-line">-</div>
                        <div class="ui-step-icon">
                            <i class="iconfont"></i>
                            <i class="ui-step-number">3</i>
                            <span class="ui-step-text">注册完成</span>
                        </div>
                    </li>
                </ol>
            </div>
    		<div class="reg-left">			
    			<ul class="regform registerform" id="step1">
                    <li>
                        <span class="starTag">*</span>
                        <label class="login-reg"><i class="login-acctpu"></i></label>
                        <div id="myselect" class="select" data-value="01">
                            <p class="select-option">我要投资</p>
                            <div class="select-selectbtn"></div>
                            <ul class="select-ul">
                                <li class="select-list is-select" data-value="01">我要投资</li>
                                <li class="select-list" data-value="02">我要借款</li>
                            </ul>
                        </div> 
                    </li>
    	            <li>
    	            	<span class="starTag">*</span>
    	            	<label class="login-reg"><i class="login-Phone"></i></label>
                        <input type="text" name="username" style="position: absolute;z-index: -1;display: none;" disabled autocomplete="off"/> 
    	            	<input id="user_phone" class="login-input" name="username" ajaxurl="/api/checkUsername" datatype="m" sucmsg="&nbsp;" errormsg="请输入正确的手机号码" nullmsg="手机号码不能为空" autocomplete="off" type="text" maxlength="11" placeholder="请输入您的手机号码">
    	            	<span class="Validform_checktip"></span> 	
    	            </li>
    	            <li>
    	            	<span class="starTag">*</span>
    	            	<label class="login-reg"><i class="login-regPassword"></i></label>
    	            	<input id="password" class="login-input" name="password" datatype="s6-20" sucmsg="&nbsp;" errormsg="密码6-20位，不能有空格" nullmsg="登录密码不能为空"  autocomplete="off" onpaste="return false" maxlength="20" type="password" plugin="passwordStrength" placeholder="密码长度为6到20位">
    					<a href="javascript:;" class="PasswordEyes"></a>
    					<span class="Validform_checktip"></span>
    					<label class="passwordStrength"><b>密码强度：</b> <span class="first">弱</span><span>中</span><span class="last">强</span></label>
    	            </li>
    			    <li>
    	            	<span class="starTag">*</span>
    	            	<label class="login-reg"><i class="login-regPassword"></i></label>
    	            	<input id="repassword" class="login-input"  name="repassword" title="请设置您的账号密码" datatype="s6-20" recheck="password" sucmsg="&nbsp;" errormsg="两次输入的内容不一致"  nullmsg="确认密码不能为空" autocomplete="off" onpaste="return false" maxlength="20" type="password" placeholder="请再次输入密码">
    					<span class="Validform_checktip"></span>
    	            </li>
    			    <li class="idCodeBox short">
    			    	<span class="starTag">*</span>
    			    	<input id="valicode" class="yzinput login-input" name="smsCode" title="请输入手机验证码" datatype="*" sucmsg="&nbsp;" nullmsg="请输入手机验证码" errormsg="手机验证码错误" autocomplete="off" maxlength="6" type="text" placeholder="请输入手机验证码">
    			    	<button id="idCode" type="button" name="validCode" class="idCode">获取短信验证码</button>
    					<span class="Validform_checktip"></span>
    			    </li>
    			    <li class="invitBox short">
    	            	<input id="referees" class="login-input" name="invitation_code" value="${phone}"  title="请输入邀请人手机号码" autocomplete="off"  maxlength="20" placeholder="请输入邀请人手机号码" <c:if test="${not empty phone}">readonly</c:if>>
    	            </li>
    	            <li class="tnreg pt10">
    	            	<input id="checked" type="checkbox" class="agree" name="agree" checked="checked" datatype="agree" sucmsg="&nbsp;" nullmsg=" ">
    	            	<label for="checked" class="regA"><em class="checkedBtn"></em>我已阅读并同意<a href="/news/detail/4" target="_blank">《元康国投注册协议》</a></label>
    					<span class="Validform_checktip"></span>
    	            </li>

    	            <li class="mt20">
    	            	<button type="button" class="logbtn checked-button" id="btn_reg">注 册</button>
    	            </li>
    	        </ul>	       
    		</div>
    	</div>
	</c:if>
	<c:if test="${type == 'realname'}">
    	<div class="reg-box warp2">
    		<div class="reg-step">
                <ol class="ui-step clearfix">
                    <li class="ui-step-start active">
                        <div class="ui-step-line active">-</div>
                        <div class="ui-step-icon">
                            <i class="iconfont"></i>
                            <i class="ui-step-number">1</i>
                            <span class="ui-step-text">填写注册资料</span>
                        </div>
                    </li>
                    <li class="active">
                        <div class="ui-step-line">-</div>
                        <div class="ui-step-icon">
                            <i class="iconfont"></i>
                            <i class="ui-step-number">2</i>
                            <span class="ui-step-text">实名信息</span>
                        </div>
                    </li>
                    <li class="ui-step-end">
                        <div class="ui-step-line">-</div>
                        <div class="ui-step-icon">
                            <i class="iconfont"></i>
                            <i class="ui-step-number">3</i>
                            <span class="ui-step-text">注册完成</span>
                        </div>
                    </li>
                </ol>
            </div>
    		<div class="reg-left">
    			<ul class="regform registerform2" id="step2">
    	            <li>
    	            	<span class="starTag">*</span>
    	            	<label class="login-reg"><i class="login-regName"></i></label>
    	            	<input id="realname" class="login-input" name="realname" title="请输入真实姓名" datatype="zh1-6" sucmsg="&nbsp;" errormsg="真实姓名格式错误" nullmsg="真实姓名不能为空" autocomplete="off" type="text" maxlength="11" placeholder="请输入真实姓名">
    					<span class="Validform_checktip"></span>
    	            </li>
    	            <li>
    	            	<span class="starTag">*</span>
    	            	<label class="login-reg"><i class="login-idno"></i></label>
    	            	<input id="idno" class="login-input" name="idno" title="请输入身份证号" datatype="code" sucmsg="&nbsp;" errormsg="身份证号格式错误" nullmsg="身份证号不能为空"  autocomplete="off" maxlength="18" type="text" placeholder="请输入身份证号">
    					<span class="Validform_checktip"></span>
    	            </li>
    			    <li>
    	            	<span class="starTag">*</span>
    	            	<label class="login-reg"><i class="login-Phone"></i></label>
    	            	<input id="reservePhone" class="login-input"  name="reservePhone" title="请输入银行预留手机号" datatype="m" sucmsg="&nbsp;"  errormsg="手机号码格式错误"  nullmsg="预留手机号不能为空" autocomplete="off"  maxlength="11" type="text" placeholder="请输入银行预留手机号">
    					<span class="Validform_checktip"></span>
    	            </li>
    				<li>
    	            	<span class="starTag">*</span>
    	            	<label class="login-reg"><i class="login-cardNo"></i></label>
    	            	<input id="cardBumber" class="login-input"  name="cardBumber" title="请输入银行卡号" datatype="*" sucmsg="&nbsp;" errormsg="银行卡号格式错误"  nullmsg="银行卡号不能为空" autocomplete="off"  maxlength="20" type="text" placeholder="请输入银行卡号">
    					<span class="Validform_checktip"></span>
    	            </li>
                    <li>
                        <span class="starTag">*</span>
                        <label class="login-reg"><i class="login-bankcode"></i></label>
                        <div class="reg-area">
                            <div class="filter-text">
                                <input class="filter-title" type="text" readonly placeholder="银行所在省级" />
                                <i class="icon icon-filter-arrow"></i>
                            </div>
                            <select> 
                                <c:forEach var="items" items="${areaList.list}"> 
                                    <option value="${items.area_code}">${items.area_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="reg-city">
                            <div class="filter-text">
                                <input class="filter-title" type="text" readonly placeholder="银行所在市级" />
                                <i class="icon icon-filter-arrow"></i>
                            </div>
                            <ul class="filter-list"></ul>
                        </div>
                        <span class="Validform_checktip"></span>
                    </li>
                    <li>
                        <span class="starTag">*</span>
                        <label class="login-reg"><i class="login-regPassword"></i></label>
                        <input type="password" class="hide">
                        <input id="payPwd" class="login-input"  name="payPwd" title="请设置交易密码" datatype="n6-6" sucmsg="&nbsp;" errormsg="交易密码为6位数字"  nullmsg="交易密码不能为空" autocomplete="off"  maxlength="6" type="password" placeholder="请设置交易密码">
                        <span class="Validform_checktip"></span>
                    </li>
                    <li>
                        <span class="starTag">*</span>
                        <label class="login-reg"><i class="login-regPassword"></i></label>
                        <input type="password" class="hide">
                        <input id="repayPwd" class="login-input"  name="repayPwd" title="重复交易密码" datatype="n6-6" recheck="payPwd" sucmsg="&nbsp;" errormsg="两次输入的密码不一致"  nullmsg="重复交易密码不能为空" autocomplete="off"  maxlength="6" type="password" placeholder="重复交易密码">
                        <span class="Validform_checktip"></span>
                    </li>
    	            <li class="mt20">
    	            	<button class="logbtn" id="btn_reg2">确认提交</button>
    	            </li>
    	        </ul>        
    	    </div>
    	</div>
	</c:if>
	<c:if test="${type == 'regsuss'}">
    	<div class="reg-box warp3">
    		<div class="reg-step">
                <ol class="ui-step clearfix">
                    <li class="ui-step-start active">
                        <div class="ui-step-line active">-</div>
                        <div class="ui-step-icon">
                            <i class="iconfont"></i>
                            <i class="ui-step-number">1</i>
                            <span class="ui-step-text">填写注册资料</span>
                        </div>
                    </li>
                    <li class="active">
                        <div class="ui-step-line active">-</div>
                        <div class="ui-step-icon">
                            <i class="iconfont"></i>
                            <i class="ui-step-number">2</i>
                            <span class="ui-step-text">实名信息</span>
                        </div>
                    </li>
                    <li class="ui-step-end active">
                        <div class="ui-step-line active">-</div>

                        <div class="ui-step-icon">
                            <i class="iconfont"></i>
                            <i class="ui-step-number">3</i>
                            <span class="ui-step-text">注册完成</span>
                        </div>
                    </li>
                </ol>
            </div>
    		<h2 class="htitle">恭喜您实名成功</h2>
    		<a class="midbaner" href="javascript:void(0);">
    			<img src="${cdnServer}/static/weipaidai/images/reg/reg_icon4.png">
    		</a>
    		<div class="kt-button">
                <c:if test="${userinfo.user_type == '01' || empty userinfo.user_name}">	
    			    <a href="/index" class="J-success" id="btn_reg4">返回首页</a>
                </c:if>
                <c:if test="${userinfo.user_type == '02' || empty userinfo.user_name}"> 
                    <a href="/user/account" class="J-success" id="btn_reg4">我的账户</a>
                </c:if>      
    		</div>		
    	</div>
	</c:if>		
</div>
<div class="reg-footer">
	<div class="footerwrap">
		<p>
			<a href="/introduce" target="_blank">公司简介</a><i></i>
			<a href="/contactus" target="_blank">联系我们</a><i></i>
			<a href="/certificate" target="_blank">资质证书</a><i></i>
			<a href="/help/required" target="_blank">帮助中心</a><i></i>
			<a href="/contactus" target="_blank">联系客服</a>
		</p>
		<p class="noborder">元康国投 Copyright Reserved  ｜  上海佩辉金融信息服务有限公司  ｜  辽ICP备18004350号-1  ｜  <a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=21011402000133号" class="badress" target="_blank"><img src="${cdnServer}/static/weipaidai/images/beian.png" class="badressimg"><span class="badressspan">辽公网安备 21011402000133号</span></a></p>
	</div>
</div>
<script type="text/javascript">ms.load([OP_CONFIG.page])</script>
</body>
</html>