<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ inclu ile="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/help.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"page/help"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 联系我们 -->
<div id="content">
    <div class="help clearfix">
    	<p class="helpms01">帮助中心</p>
    	<ul class="ulleft fl">
    		<li class="lileft <c:if test="${type == 'required'}">lilefthover</c:if>"><a href="/help/required">新手必读</a></li>
    		<li class="lileft <c:if test="${type == 'account'}" >lilefthover</c:if>"><a href="/help/account">账户管理</a></li>
    		<li class="lileft <c:if test="${type == 'safety'}" >lilefthover</c:if>"><a href="/help/safety">安全保障</a></li>
    		<li class="lileft lileft-last-child <c:if test="${type == 'other'}" >lilefthover</c:if>"><a href="/help/other">其他问题</a></li>
    	</ul>
    	<div class="helpright fl">
    		<ul class="wentiz">
    			<c:if test="${type == 'required'}" > 
    			<!-- 新手必读 -->
    			<li class="wentili" >
    				<div class="wentip1 clearfix" data-type="1">
    					<p class="wentip1wz fl">新手必读</p>
    					<p class="wentip1img fr"></p>
    				</div>
					<div class="wentip2">
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">我可以投资吗？</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">只要年满18周岁，具有完全民事权利能力和民事行为能力，可以在元康国投网站上进行注册、完成实名认证、绑定银行卡，成为投资人。</p>
							</div>
						</div>
						<div class="wentip2wz">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">怎样进行投资？</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">1. 在元康国投网站上进行注册、通过实名认证、成功绑定银行卡;</p>
									<p class="wentip3_3">2. 账户充值;</p>
									<p class="wentip3_3">3. 确认投资，投资成功。</p>
								</div>
							</div>
						</div>
					</div>
    			</li>
    			</c:if>
    			<c:if test="${type == 'account'}" > 
    			<!-- 登录注册 -->
    			<li class="wentili" >
    				<div class="wentip1 clearfix" data-type="1">
    					<p class="wentip1wz fl">登录注册</p>
    					<p class="wentip1img fr"></p>
    				</div>
    				<div class="wentip2">
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">如何注册元康国投</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									打开浏览器输入元康国投官网网址【http://www.guotoutianxia.com/】点击【立即注册】按照提示输入正确的注册信息即可注册元康国投账户。
								</div>
							</div>
						</div>
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">4.注册时，进行手机验证，收不到短信怎么办?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">1. 请确认手机是否安装短信拦截或过滤软件;</p>
									<p class="wentip3_3">2. 请确认手机是否能够正常接收短信(信号问题、欠费、停机等);</p>
									<p class="wentip3_3">3. 短信收发过程中可能会存在延迟，请耐心等待，短信在120秒内均有效;</p>
									<p class="wentip3_3">4. 投资者还可以联系客服，寻求帮助(400-180-5717)。</p>
								</div>
							</div>
						</div>
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">什么是推荐人?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">1. 用户在“元康国投”完成注册后，即拥有了成为本平台推荐人的资格。</p>
									<p class="wentip3_3">
									2.当新用户在注册的时候，填写了已注册投资者的账号做为推荐人，该投资者就成为了这个新注册用户的推荐人。</p>
								</div>
							</div>
						</div>
						<div class="wentip2wz">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">如何进行登录?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									打开浏览器输入元康国投官网网址【http://www.guotoutianxia.com/】点击【立即登录】输入元康国投账号密码，即可登录元康国投。
								</div>
							</div>
						</div>
					</div>
    			</li>
    			<!-- 账户密码 -->
    			<li class="wentili" >
    				<div class="wentip1 clearfix" data-type="1">
    					<p class="wentip1wz fl">账户密码</p>
    					<p class="wentip1img fr"></p>
    				</div>
    				<div class="wentip2">
    					<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">元康国投账户的密码都有哪些?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">1.登录密码</p>
									<p class="wentip3_3">2.交易密码</p>
								</div>
							</div>
						</div>
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">如何修改登录密码?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">登录元康国投点击【我的账户】-【安全中心】选择修改登录密码即可。
								</div>
							</div>
						</div>
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">如何找回登录密码?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">如何找回登录密码?</p>
								<div class="wentip3_2 fl">打开元康国投官网【http://www.guotoutianxia.com/】点击【登录】在登录界面点击【忘记密码】即可通过手机号码找回登录密码。
								</div>
							</div>
						</div>
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">如何修改交易密码?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									登录元康国投点击【我的账户】-【安全中心】选择修改交易密码即可。
								</div>
							</div>
						</div>
<!-- 						<div class="wentip2wz">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">如何通过手机号找回交易密码?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									登录元康国投打开【我的元康国投】点击【账户管理】-【安全信息】选择找回交易密码，系统会发送一条验证信息到投资者绑定的手机号码当中，输入收到的手机验证码后即可点击找回交易密码。
								</div>
							</div>
						</div> -->
    				</div>
    			</li>
    			<!-- 充值 -->
    			<li class="wentili">
    				<div class="wentip1 clearfix" data-type="1">
    					<p class="wentip1wz fl">充值</p>
    					<p class="wentip1img fr"></p>
    				</div>
    				<div class="wentip2">
	    				<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">充值介绍</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">元康国投用户可以通过与元康国投合作的银行给元康国投账户进行充值，成功后可以用元康国投账户的余额进行投资。</p>
									<p class="wentip3_3">如果通过网上银行支付，银行卡需要先开通网上银行功能。</p>
									<p class="wentip3_3">快捷支付充值无需开通网上银行功能也可进行充值操作。</p>
								</div>
							</div>
						</div>
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">如何申请开通网上银行?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									目前所有商业银行都支持个人网银业务，投资者只需要携带有效身份证件，到当地投资者所持银行卡的发卡行任意营业网点，即可申请开通网上银行业务。投资者还可以到商业银行官网查看个人网上银行详细信息。
								</div>
							</div>
						</div>
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">绑定银行卡，为什么要填写省市和开户行字段?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									元康国投是通过第三方支付平台为用户提供付款服务，第三方支付平台将用户银行卡信息上传至银行做付款操作时，可能会进行省市和开户行字段的校验，如果为空或不正确可能会导致付款失败。 所以为了投资者提现的便利和安全，请投资者认真填写省市和开户行。
								</div>
							</div>
						</div>
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">绑定银行卡，不知道银行卡的省市和开户行怎么办?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">1. 投资者可以持银行卡及有效证件到发卡行的营业网点查询；</p>
									<p class="wentip3_3">2. 投资者可以拨打自已银行卡开户行的24小时客服电话，选择人工服务，按照语音提示输入要查询的银行卡号和户主姓名，客服人员就会告知你开户行和所在地；</p>
								</div>
							</div>
						</div>
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">如何给账户充值?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">登录元康国投点击【我的账户】-【充值】</p>
								</div>
							</div>
						</div>
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">充值限额是多少?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									充值限额是由银行支付限额、第三方支付平台支付限额和用户自己设定的银行支付限额三者共同决定，三者取最小值。
								</div>
							</div>
						</div>
						<div class="wentip2wz">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">充值会不会扣手续费?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									元康国投充值不收取手续费 
								</div>
							</div>
						</div>
    				</div>
    			</li>
    			<!-- 提现 -->
    			<li class="wentili">
    				<div class="wentip1 clearfix" data-type="1">
    					<p class="wentip1wz fl">提现</p>
    					<p class="wentip1img fr"></p>
    				</div>
    				<div class="wentip2">
    					<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">如何提现?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">投资者可以随时将自己在元康国投账户中的可用余额申请提现到投资者在元康国投所绑定的银行卡上，提现金额必须大于100元。</p>
									<p class="wentip3_3">注意：请正确提供申请提现的银行卡账号，并确保该账号的开户人姓名和投资者在元康国投上提供的身份证上的真实姓名一致，否则无法成功提现。</p>
									<p class="wentip3_3">各大银行的客服电话：</p>
									<table class="bank_limit_table">
									<tbody class="tbody02">
									<tr class="colortr">
										<td>招商银行</td>
										<td>中国银行</td>
										<td>建设银行</td>
										<td>工商银行</td>
										<td>中信银行</td>
									</tr>
									<tr>
										<td>95555</td>
										<td>95566</td>
										<td>95533</td>
										<td>95588</td>
										<td>95558</td>
									</tr>
									<tr class="colortr">
										<td>农业银行</td>
										<td>民生银行</td>
										<td>光大银行</td>
										<td>交通银行</td>
										<td>广发银行</td>
									</tr>
									<tr>
										<td>95599</td>
										<td>95568</td>
										<td>95595</td>
										<td>95559</td>
										<td>400-830-8003</td>
									</tr>
									<tr class="colortr">
										<td>浦发银行</td>
										<td>邮政银行</td>
										<td>华夏银行</td>
										<td>兴业银行</td>
										<td>平安银行</td>
									</tr>
									<tr>
										<td>95528</td>
										<td>95580</td>
										<td>95577</td>
										<td>95561</td>
										<td>95511转3</td>
									</tr>
									<tr class="colortr">
										<td>上海银行</td> 
									</tr>
									<tr>
										<td>95594</td>
										 
									</tr>
								</tbody></table>
								</div>
							</div>
						</div>
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">申请提现后，多久能到账?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">“账户余额”提现T+1，如遇节假日顺延至下个工作日24:00前到账，其他特殊情况，按照平台公告进行处理。</div>
							</div>
						</div>
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">提现手续费是多少?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">目前元康国投进行提现暂时不需要任何手续费。</p>
								</div>
							</div>
						</div>
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">如果所填写的银行卡信息不正确，能否提现成功?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">1. 如果投资者填写的银行卡号有误或该银行卡开户名不是本人实名认证的姓名，将会导致提现失败；</p>
									<p class="wentip3_3">2. 如果投资者填写的银行、开户行、开户行所在地信息不正确，则该笔提现在提交到银行做处理时，有可能由于信息校验不正确而提现失败。</p>
								</div>
							</div>
						</div>
						<div class="wentip2wzxu">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">提现未到账怎么办?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">申请提现之后。辛苦您在1-3个工作日关注提现状态，登陆元康国投账户，查询提现记录可以看到提现状态，具体以银行入账为准，也可以联系客服寻求帮助（400-180-5717）</p>
								</div>
							</div>
						</div>
						<div class="wentip2wz">
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">为什么会提现失败?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">1.银行账户状态异常，或者正在办理挂失。</p>
									<p class="wentip3_3">2.省份、城市、开户行等银行信息错误。如遇到以上情况，我们会在收到支付机构入账失败的通知后解除投资者的资金冻结，请您不要担心！</p>
								</div>
							</div>
						</div>
    				</div>
    			</li>
    			<!-- 安全认证 -->
    			<li class="wentili">
    				<div class="wentip1 clearfix" data-type="1">
    					<p class="wentip1wz fl">安全认证</p>
    					<p class="wentip1img fr"></p>
    				</div>
    				<div class="wentip2">
	    				<div class="wentip2wzxu">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">为什么要进行安全认证?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									为了保障用户资金的安全性和合同的有效性，元康国投要求所有投资人及借款人必须通过身份证绑定、手机号绑定以及交易密码设置。安全认证的过程简单便捷，元康国投对于所有个人资料均作严格保密。
								</div>
							</div>
	    				</div>
	    				<div class="wentip2wzxu">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">如何进行实名认证?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">我的账户—安全信息—实名认证 </p>
								</div>
							</div>
	    				</div>
	    				<div class="wentip2wzxu">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">身份信息正确，实名认证未通过怎么办?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									可能是由于第三方认证系统没有及时更新投资者的身份信息导致的，投资者可以联系客服寻求帮助（400-180-5717）。
								</div>
							</div>
	    				</div>
	    				<div class="wentip2wz">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">绑定手机号码遗失或者无法使用是否可以进行改绑?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									如投资者无法通过网站进行绑定手机号码的更换，投资者可以联系客服寻求帮助（400-180-5717）。
								</div>
							</div>
	    				</div>
    				</div>
    			</li>
    			<!-- 消息中心 -->
    			<li class="wentili">
    				<div class="wentip1 clearfix" data-type="1">
    					<p class="wentip1wz fl">消息中心</p>
    					<p class="wentip1img fr"></p>
    				</div>
    				<div class="wentip2">
    					<div class="wentip2wz">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">28.站内消息和手机短信对投资者有什么用?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									如果投资者的账户信息发生变动，元康国投就会推送消息给投资者，这些消息与投资者的账户息息相关，包括账户安全、交易变化、金额变化等消息，让投资者可以及时收到投资者元康国投账户有关信息的变动情况。
								</div>
							</div>
	    				</div>
    				</div>
    			</li>
    			</c:if>
    			<c:if test="${type == 'safety'}">
    			<!-- 账户隐私及安全 -->
    			<li class="wentili">
    				<div class="wentip1 clearfix" data-type="1">
    					<p class="wentip1wz fl">账户隐私及安全</p>
    					<p class="wentip1img fr"></p>
    				</div>
    				<div class="wentip2">
	    				<div class="wentip2wz">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">权限管理和隐私安全</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">我们严格遵守国家相关的法律法规，对用户的隐私信息进行保护。未经投资者的同意，元康国投不会向任何第三方公司、组织和个人披露投资者的个人信息、账户信息以及交易信息（法律法规另有规定的除外）。</p>
									<p class="wentip3_3">同时，元康国投公司内部也设有严格、完善的权限管理体系，以保证每一位内部员工都只能查看自己职责和权限之内的数据和信息。</p>
								</div>
							</div>
	    				</div>
    				</div>
    			</li>
    			<!-- 用户的自我保护 -->
    			<li class="wentili">
    				<div class="wentip1 clearfix" data-type="1">
    					<p class="wentip1wz fl">用户的自我保护</p>
    					<p class="wentip1img fr"></p>
    				</div>
    				<div class="wentip2">
    					<div class="wentip2wzxu">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">牢记元康国投官方网址</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">牢记元康国投官方网址：http://www.guotoutianxia.com/</p>
									<p class="wentip3_3">不要点击来历不明的链接访问元康国投，谨防网站钓鱼和欺诈。我们建议用户将元康国投官方网址加入浏览器收藏夹，以方便用户下次登录。</p>
								</div>
							</div>
	    				</div>
	    				<div class="wentip2wzxu">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">为理财投资者的元康国投账户设置高强度的登录密码</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">用户在设置密码时，最好使用数字和字母混合，不要使用纯数字或纯字母，且密码长度要在8位以上。</p>
									<p class="wentip3_3">尽量不要使用用户的生日、姓名拼音、身份证号码、手机号或是邮箱名作为登录密码。</p>
									<p class="wentip3_3">尽量不要使用连续的，或重复的字母、数字组合作为密码，例如：aaaaaa，111111，abcdef，123456。</p>
									<p class="wentip3_3">尽量不要使用以下常用密码，例如：qazwsx，qwerty，mima123，password等。</p>
								</div>
							</div>
	    				</div>
	    				<div class="wentip2wzxu">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">注重电脑运行环境的安全</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">1. 及时为用户的电脑进行系统更新，安装系统安全补丁，以防系统漏洞被黑客利用。</p>
									<p class="wentip3_3">2. 为用户的电脑安装杀毒软件或防火墙，并定期为电脑进行查毒、杀毒。</p>
									<p class="wentip3_3">3. 避免在网吧等公共场所使用网上银行，不要打开来历不明的电子邮件。</p>
									<p class="wentip3_3">4. 不要访问危险的网站，不要使用来历不明的软件。</p>
									<p class="wentip3_3">5.建议使用360浏览器进行登陆元康国投和投资。</p>
								</div>
							</div>
	    				</div>
	    				<div class="wentip2wzxu">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">时刻注意保护个人隐私</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									用户在平台上交流的过程中，不要向其他用户透露自己真实姓名与住址等，以防个人信息被盗取造成损失。
								</div>
							</div>
	    				</div>
	    				<div class="wentip2wzxu">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">避免私下交易</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									元康国投建议用户避免私下交易。私下交易的约束力极低，造成逾期的风险非常高，同时用户的个人信息将有可能被泄漏，存在遭遇诈骗甚至受到严重犯罪侵害的隐患。
								</div>
							</div>
	    				</div>
	    				<div class="wentip2wz">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">投资是否有额外费用?</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									目前在元康国投所进行的，充值/投资/提现，暂时不收取额外费用。
								</div>
							</div>
	    				</div>
    				</div>
    			</li>
    			</c:if>
    			<c:if test="${type == 'other'}">
    			<!-- 红包使用 -->
    			<li class="wentili">
    				<div class="wentip1 clearfix" data-type="1">
    					<p class="wentip1wz fl">红包使用</p>
    					<p class="wentip1img fr"></p>
    				</div>
    				<div class="wentip2">
    					<div class="wentip2wzxu">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">什么是元康国投红包？</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									红包是元康国投给予用户的电子增值福利。
								</div>
							</div>
	    				</div>
	    				<div class="wentip2wzxu">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">如何获得红包？</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									用户可以通过参与元康国投各类活动获取。
								</div>
							</div>
	    				</div>
	    				<div class="wentip2wzxu">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">红包类型</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									投资红包、加息红包、现金红包（按照各红包使用详则使用）
								</div>
							</div>
	    				</div>
	    				<div class="wentip2wzxu">
	    					<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help02.png" class="wentip3_1 fl">
								<p class="wentip3_2 fl">红包使用注意事项</p>
							</div>
							<div class="wentip3 clearfix">
								<img src="${cdnServer}/static/weipaidai/images/help03.png" class="wentip3_1 fl">
								<div class="wentip3_2 fl">
									<p class="wentip3_3">红包不可叠加使用；</p>
									<p class="wentip3_3">请按照红包使用金额，投资期限范围使用；</p>
									<p class="wentip3_3">在红包有效期内使用有效；</p>
									<p class="wentip3_3">投资使用红包请勾选。</p>
								</div>
							</div>
	    				</div>
	    				<div class="wentip2wz">红包最终使用解释权归元康国投所有，如有疑问，请咨询客服。</div>
    				</div>
    			</li>
    			</c:if>
    		</ul>
    	</div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>