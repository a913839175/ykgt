<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/wpd.tld" prefix="wpd"%>
<!-- 我的账户 -->
<div class="contentleft yellow fl">
	<div class="FinancingCenter">
		<p class="fcwz1">借款中心</p>
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
					<div class="status-li jkstatus-li1 <c:if test='${userinfo.realname_flag == 1}'>actstatic</c:if>"></div>
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
					<div class="status-li jkstatus-li2 fl <c:if test='${userinfo.bank_flag == 1}'>actstatic</c:if>"></div>
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
					<div class="status-li jkstatus-li3 fl <c:if test='${userinfo.phone_flag == 1}'>actstatic</c:if>"></div>
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
				<c:if test="${userinfo.pay_flag == 1}">
					<a href="/user/safety">
				</c:if>
				<c:if test="${userinfo.pay_flag != 1}">
					<a href="/user/safety">
				</c:if>
					<div class="status-li jkstatus-li4 fl <c:if test='${userinfo.pay_flag == 1}'>actstatic</c:if>"></div>
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
                        <p class="fcdown_images1 fl fcdown_img"></p>
                        <p class="fcdown_liwz2 fl">账户总览</p>
                    </div>
                </a>
            </li>
            <li class="fcdown_li clearfix <c:if test="${type == 'myborrow'}">active</c:if>">
                <a href="/user/myborrow">
                    <p class="fcdown_liwz1 fl"></p>
                    <div class="fcdownlk fl clearfix">
                        <p class="fcdown_images2 fl fcdown_img"></p>
                        <p class="fcdown_liwz2 fl">我的借款</p>
                    </div>
                </a>
            </li>
            <!--<li class="fcdown_li clearfix <c:if test="${type == 'material'}">active</c:if>">
                <a href="/user/material">
                    <p class="fcdown_liwz1 fl"></p>
                    <div class="fcdownlk fl clearfix">
                        <p class="fcdown_images3 fl fcdown_img"></p>
                        <p class="fcdown_liwz2 fl">借款资料</p>
                    </div>
                </a>
            </li> -->
            <li class="fcdown_li clearfix <c:if test="${type == 'safety'}">active</c:if>">
                <a href="/user/safety">
                    <p class="fcdown_liwz1 fl"></p>
                    <div class="fcdownlk fl clearfix">
                        <p class="fcdown_images4 fl fcdown_img"></p>
                        <p class="fcdown_liwz2 fl">安全中心</p>
                    </div>
                </a>
            </li>
        </ul>
    </div>
</div>