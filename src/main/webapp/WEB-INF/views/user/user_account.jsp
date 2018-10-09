<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/tip-yellowsimple.css?v=${version}" />
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_account.css?v=${version}" />
<script type="text/javascript">
	var OP_CONFIG={"page":"page/user_account"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 我的账户 -->
<div id="content">
	<div class="cont1200 clearfix">
		<%@ include file="user_menu.jsp"%>
		<div class="contentright fl">
			<div class="NtotalMain" data="${usermain}">
				<div class="clearfix NtotalTop">
					<div class="NtotalTopOne">
						<div>
							<a href="javascript:void(0);" class="eyes " id="hidden_toggle"></a>
							<span class="NBalanceOne">可用余额<span class="NBalanceTwo">（元）</span></span>
							<a id="J_refresh" href="javascript:void(0);"></a>
						</div>
						<p class="NtotalTopOneDown">
							<c:if test="${usermain.display_status != 2}">
								<span data-title="${usermain.balance}" title="${usermain.balance}" class="NBalanceThree num">${usermain.balance}</span>
								<img src="${cdnServer}/static/weipaidai/images/investxq04.png" class="tips_abalance" title="可用余额 = 总金额 - 在投金额 - 待收金额 - 冻结金额">
							</c:if>
							<c:if test="${usermain.display_status == 2}">
								<span data-title="${usermain.balance}" class="NBalanceThree num">*****</span>
								<img src="${cdnServer}/static/weipaidai/images/investxq04.png" class="tips_abalance" title="可用余额 = 总金额 - 在投金额 - 待收金额 - 冻结金额">
							</c:if>
						</p>
					</div>
					<p class="NtotalXian"></p>
					<div class="NtotalTopTwo">
						<div>
							<span class="NBalanceOne">资产总额<span class="NBalanceTwo">（元）</span></span>
						</div>
						<p class="NtotalTopTwoDown">
							<c:if test="${usermain.display_status != 2}">
								<span data-title="${usermain.total}" title="${usermain.total}" class="NBalanceThree num">${usermain.total}</span>
								<img src="${cdnServer}/static/weipaidai/images/investxq04.png" class="tips_abalance" title="总金额 = 可用金额 + 在投金额 + 待收金额 + 冻结金额">
							</c:if>
							<c:if test="${usermain.display_status == 2}">
								<span data-title="${usermain.total}" class="NBalanceThree num">*****</span>
								<img src="${cdnServer}/static/weipaidai/images/investxq04.png" class="tips_abalance" title="总金额 = 可用金额 + 在投金额 + 待收金额 + 冻结金额">
							</c:if>

							
						</p>
					</div>
					<p class="NtotalXian"></p>
					<p class="NtotalTopThree">
						<a href="javascript:void(0);" id="recharge">充值</a>
						<a href="javascript:void(0);" id="withdrawNow">提现</a>
					</p>
				</div>
				<ul class="clearfix Ntotal_ul">
					<li class="Ntotal_li">
						<p class="Ntotal_liPOne">在投本金（元）</p>
						
						<c:if test="${usermain.display_status != 2}">
							<p class="Ntotal_liPTwo num" data-title="${usermain.used_account}">${usermain.used_account}</p>
						</c:if>
						<c:if test="${usermain.display_status == 2}">
							<p class="Ntotal_liPTwo num" data-title="${usermain.used_account}">*****</p>
						</c:if>
					</li>
					<p class="NtotalXian"></p>
					<li class="Ntotal_li">
						<p class="Ntotal_liPOne">待收收益（元）</p>
						<c:if test="${usermain.display_status != 2}">
							<p class="Ntotal_liPTwo num" data-title="${usermain.await_shouyi}">${usermain.await_shouyi}</p>
						</c:if>
						<c:if test="${usermain.display_status == 2}">
							<p class="Ntotal_liPTwo num" data-title="${usermain.await_shouyi}">*****</p>
						</c:if> 
						
					</li>
					<p class="NtotalXian"></p>
					<li class="Ntotal_li">
						<p class="Ntotal_liPOne">累计收益（元）</p>
						<c:if test="${usermain.display_status != 2}">
							<p class="Ntotal_liPTwo num" data-title="${usermain.repay_shouyi}">${usermain.repay_shouyi}</p>
						</c:if>
						<c:if test="${usermain.display_status == 2}">
							<p class="Ntotal_liPTwo num" data-title="${usermain.repay_shouyi}">*****</p>
						</c:if>
					</li>
					<p class="NtotalXian"></p>
					<li class="Ntotal_li">
						<p class="Ntotal_liPOne">冻结金额（元）</p>
						
						<c:if test="${usermain.display_status != 2}">
							<p class="Ntotal_liPTwo num" data-title="${usermain.frozen_account}">${usermain.frozen_account}</p>
						</c:if>
						<c:if test="${usermain.display_status == 2}">
							<p class="Ntotal_liPTwo num" data-title="${usermain.frozen_account}">*****</p>
						</c:if>
					</li>
				</ul>
			</div>
			<div class="content-date">
				<div class="box-date">
					<h2>收款明细</h2>
					<div class="query-area">
						<p class="sy" id="yingshou">
							本月到期应收（元）：<em></em>
						</p>
						<!-- <input type="button" value="确定" id="J_dateBtn" class="btn-date" name="">  -->
						<select id="J_month">
							<option value="1">1月</option>
							<option value="2">2月</option>
							<option value="3">3月</option>
							<option value="4">4月</option>
							<option value="5">5月</option>
							<option value="6">6月</option>
							<option value="7">7月</option>
							<option value="8">8月</option>
							<option value="9">9月</option>
							<option value="10">10月</option>
							<option value="11">11月</option>
							<option value="12">12月</option>
						</select> 
						<select id="J_year">
							<option value="2016">2016年</option>
							<option value="2017">2017年</option>
							<option value="2018">2018年</option>
							<option value="2019">2019年</option>
							<option value="2020">2020年</option>
							<option value="2021">2021年</option>
							<option value="2022">2022年</option>
							<option value="2023">2023年</option>
							<option value="2024">2024年</option>
							<option value="2025">2025年</option>
							<option value="2026">2026年</option>
							<option value="2027">2027年</option>
							<option value="2028">2028年</option>
							<option value="2029">2029年</option>
							<option value="2030">2030年</option>
						</select>
					</div>
					<div class="clearfix">
						<div class="left-show">
							<h3 id="huikuan_date"><i class="now"></i><em class="vam"></em></h3>
							<div class="mt10" id="huiDetail">
								<img src="${cdnServer}/static/weipaidai/images/account12.png" class="icon">
								<p id="huidesc">当天没有项目回款<br/><a href="/invest" target="_blank">快去投资</a>吧</p>
							</div>
						</div>
						<div class="date-right clearfix">
							<div class="f-rili-table">
								<div class="f-rili-head clearfix">
									<div class="f-rili-th">日</div>
									<div class="f-rili-th">一</div>
									<div class="f-rili-th">二</div>
									<div class="f-rili-th">三</div>
									<div class="f-rili-th">四</div>
									<div class="f-rili-th">五</div>
									<div class="f-rili-th">六</div>
									<div class="clear"></div>
								</div>
								<div class="f-tbody clearfix"></div>
							</div>
							<!--存储当前年和月DOM-->
							<span class="f-year"></span> <span class="f-month"></span> <span class="preBtn"></span> <span class="nextBtn"></span>
						</div>
					</div>
				</div>
			</div>
			<div class="content-record">
				<div class="content-r clearfix">
					<h3 class="title fl">交易记录</h3>
					<div class="content-right fr">
						<div class="rsd-time-title fl">起止日期：</div>
						<div class="quick-input-date fl">
	                            <input type="text" id="start_time" class="date-search-input" value="" readonly="">
	                             <span class="separator-pd">-</span>
	                             <input type="text" id="end_time" class="date-search-input" value="" readonly="">
	                    </div>
	                </div>
				</div>
				<div class="record-box">
					<div class="record-table">
						<div class="hd clearfix">
							<div class="sort sp sp1 clearfix">
								<p class="sp1mz1 fl">时间</p>
								<p class="sp1img1 fl"></p>
							</div>
							<p class="sp sp2 tcenter">操作类型</p>
							<p class="sp sp3 tcenter">操作说明</p>
							<div class="sort sp sp4 clearfix">
								<p class="sp1mz2 fl">金额(元)</p>
								<p class="sp1img1 fl"></p>
							</div>
							<p class="sp sp5 tcenter">交易后可用金额(元)</p>
							<p class="sp sp6">单号</p>
						</div>
						<div class="record-list" id="recordList">

						</div>
					</div>
				</div>
				<!-- 分页 -->
				<div class="contpage">
					<div class="M-box"></div>
				</div>
				<input type="hidden" class="bdnum" value="">
			</div>
		</div>	
	</div>
</div>
<c:if test="${not empty order_pay_msg}">
	<script type="text/javascript">
		G.$alert("${order_pay_msg}",false, function() {
			window.location.href = '/user/account';
		},true);
	</script>
</c:if>
<%@ include file="../common/accountfooter.jsp"%>