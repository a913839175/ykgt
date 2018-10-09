<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/wpd.tld" prefix="wpd"%>
<!-- 我的账户 -->
<div class="contentleft fl">
	<div class="FinancingCenter">
		<p class="fcwz1">理财中心</p>
		<img src="${cdnServer}/static/weipaidai/images/account06.png" class="fcimg1">
		<p class="fcwz2">${wpd:getPhone(userinfo.user_name)}</p>
		<ul class="status-ul clearfix">
			<li class="fl statusnew-li mrn">
				<c:if test="${userinfo.realname_flag == 1}">
					<a href="javascript:void(0);">
				</c:if>
				<c:if test="${userinfo.realname_flag != 1}">
					<a href="/user/reg/realname">
				</c:if>
					<div class="status-li status-li1 <c:if test='${userinfo.realname_flag == 1}'>activestatus</c:if>"></div>
					<p class="xstatus-p xstatus-p1"></p>
					<div class="xstatus-n xstatus-n1">
						<c:if test="${userinfo.realname_flag == 1}">
							<span>您已进行实名认证</span>
						</c:if>
						<c:if test="${userinfo.realname_flag != 1}">
							<span>您还未进行实名认证</span>
							<em>开通</em>
						</c:if>	
					</div>
				</a>
			</li>
			<li class="fl statusnew-li">
				<c:if test="${userinfo.bank_flag == 1}">
					<a href="javascript:void(0);">
				</c:if>
				<c:if test="${userinfo.bank_flag != 1 && userinfo.depository_flag != 1}">
					<a href="/user/reg/realname">
				</c:if>
				<c:if test="${userinfo.bank_flag != 1 && userinfo.depository_flag == 1}">
					<a href="/user/safety">
				</c:if>
					<div class="status-li status-li2 fl <c:if test='${userinfo.bank_flag == 1}'>activestatus</c:if>"></div>
					<p class="xstatus-p xstatus-p2"></p>
					<div class="xstatus-n xstatus-n1">
						<c:if test="${userinfo.bank_flag == 1}">
							<span>您已绑定银行卡</span>
						</c:if>
						<c:if test="${userinfo.bank_flag != 1 && userinfo.depository_flag != 1}">
							<span>您还未绑定银行卡</span>
							<em>开通</em>
						</c:if>
						<c:if test="${userinfo.bank_flag != 1 && userinfo.depository_flag == 1}">
							<span>您还未绑定银行卡</span>
							<em>开通</em>
						</c:if>
					</div>
				</a>
			</li>
			<li class="fl statusnew-li">
				<c:if test="${userinfo.phone_flag == 1}">
					<a href="javascript:void(0);">
				</c:if>
				<c:if test="${userinfo.phone_flag != 1 && userinfo.depository_flag != 1}">
					<a href="/user/reg/realname">
				</c:if>
				<c:if test="${userinfo.phone_flag != 1 && userinfo.depository_flag == 1}">
					<a href="/user/safety">
				</c:if>
					<div class="status-li status-li3 fl <c:if test='${userinfo.phone_flag == 1}'>activestatus</c:if>"></div>
					<p class="xstatus-p xstatus-p3"></p>
					<div class="xstatus-n xstatus-n1">
						<c:if test="${userinfo.phone_flag == 1}">
							<span>您已绑定手机</span>
						</c:if>
						<c:if test="${userinfo.phone_flag != 1 && userinfo.depository_flag != 1}">
							<span>您还未绑定手机</span>
							<em>开通</em>
						</c:if>
						<c:if test="${userinfo.phone_flag != 1 && userinfo.depository_flag == 1 }">
							<span>您还未绑定手机</span>
							<em>开通</em>
						</c:if>
					</div>
				</a>
			</li>
			<li class="fl statusnew-li" id="dealrevamp">
				<a href="/user/safety">
					<div class="status-li status-li4 fl <c:if test='${userinfo.pay_flag == 1}'>activestatus</c:if>"></div>
					<p class="xstatus-p xstatus-p4"></p>
					<div class="xstatus-n xstatus-n1">			
						<c:if test="${userinfo.pay_flag == 1}">
							<span class="administrate">您已设置交易密码</span>
							<em>管理</em>
						</c:if>
						<c:if test="${userinfo.pay_flag != 1}">
							<span>您还未设置交易密码</span>
							<em>开通</em>
						</c:if>
					</div>
				</a>
			</li>
		</ul>
	</div>
	<div class="Financingdown">
		<ul class="fcdown_ul">
			<li class="fcdown_li clearfix <c:if test="${type == 'account'}">active</c:if>">
				<a href="/user/account">
					<p class="fcdown_liwz1 fl"></p>
					<div class="fcdownlk fl clearfix">
						<p class="fcdown_img1 fl fcdown_img"></p>
						<p class="fcdown_liwz2 fl">账户总览</p>
					</div>
				</a>
			</li>
			<!--<li class="fcdown_li clearfix">
				<a href="">
					<p class="fcdown_liwz1 fl"></p>
					<div class="fcdownlk fl clearfix">
						<p class="fcdown_img2 fl fcdown_img"></p>
						<p class="fcdown_liwz2 fl">预约投标</p>
					</div>
				</a>
			</li> -->
			<li class="fcdown_li clearfix <c:if test="${type == 'myinvest'}">active</c:if>">
				<a href="/user/myinvest">
					<p class="fcdown_liwz1 fl"></p>
					<div class="fcdownlk fl clearfix">
						<p class="fcdown_img3 fl fcdown_img"></p>
						<p class="fcdown_liwz2 fl">我的投资</p>
					</div>
				</a>
			</li>
			<!-- <li class="fcdown_li clearfix <c:if test="${type == 'claim'}">active</c:if>">
				<a href="/user/claim">
					<p class="fcdown_liwz1 fl"></p>
					<div class="fcdownlk fl clearfix">
						<p class="fcdown_img4 fl fcdown_img"></p>
						<p class="fcdown_liwz2 fl">历史债权</p>
					</div>
				</a>
			</li> -->
			<!--<li class="fcdown_li clearfix <c:if test="${type == 'vip'}">active</c:if>">
				<a href="/user/vip">
					<p class="fcdown_liwz1 fl"></p>
					<div class="fcdownlk fl clearfix">
						<p class="fcdown_img5 fl fcdown_img"></p>
						<p class="fcdown_liwz2 fl">会员中心</p>
					</div>
				</a>
			</li> -->
			<li class="fcdown_li clearfix <c:if test="${type == 'invite'}">active</c:if>">
				<a href="/user/invite">
					<p class="fcdown_liwz1 fl"></p>
					<div class="fcdownlk fl clearfix">
						<p class="fcdown_img6 fl fcdown_img"></p>
						<p class="fcdown_liwz2 fl">邀请好友</p>
					</div>
				</a>
			</li>
			<li class="fcdown_li clearfix <c:if test="${type == 'safety'}">active</c:if>">
				<a href="/user/safety">
					<p class="fcdown_liwz1 fl"></p>
					<div class="fcdownlk fl clearfix">
						<p class="fcdown_img7 fl fcdown_img"></p>
						<p class="fcdown_liwz2 fl">安全中心</p>
					</div>
				</a>
			</li>
			<li class="fcdown_li clearfix <c:if test="${type == 'hongbao'}">active</c:if>">
				<a href="/user/hongbao">
					<p class="fcdown_liwz1 fl"></p>
					<div class="fcdownlk fl clearfix">
						<p class="fcdown_img8 fl fcdown_img"></p>
						<p class="fcdown_liwz2 fl">我的红包</p>
					</div>
				</a>
			</li>
			<li class="fcdown_li clearfix <c:if test="${type == 'message'}">active</c:if>">
				<a href="/user/message">
					<p class="fcdown_liwz1 fl"></p>
					<div class="fcdownlk fl clearfix">
						<p class="fcdown_img9 fl fcdown_img"></p>
						<p class="fcdown_liwz2 fl">消息管理<c:if test="${noreadList.total_no_read > 0}"><em class="readall_icon"></em></c:if></p>
					</div>
				</a>
			</li>
		</ul>
	</div>
</div>