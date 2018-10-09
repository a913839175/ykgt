<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/recharge.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"page/user_recharge"};
</script>
<%@ include file="../common/header.jsp"%>  
<div class="content">
	<div class="recharge-box">
		<!-- <h2 class="recharge-title">充值</h2> -->
		<h2 class="recharge-title">账户余额：<span class="recharge_account">${usermain.balance}</span><em>元</em></h2>
		<form class="recharge-form" method="post" action="/pay/openRecharge">
			<!-- <div class="form-group form-balance">
				<label>账户余额：</label><span>${usermain.balance}</span><em>元</em>
			</div> -->
			<div class="form-group">
				<label>充值金额：</label><input class="recharge-input" name="transAmt" maxlength="10" datatype="isNumberthan100" nullmsg="请输入金额" sucmsg=" " errormsg='请输入大于100的金额' autocomplete="off">
				<input type="hidden" name="frontRetUrl" class="frontRetUrl" autocomplete="off">
			</div>
			<div class="form-group">
				<label>充值方式：</label>
				<div class="recharge-tab" data-id="0">	
					<p class="recharge-tab-list active">网银充值</p>
					<p class="recharge-tab-list">快捷支付</p>
					<input type="hidden" name="pay_type" class="pay_type" value="0">
				</div>
			</div>
			<div class="form-group form-bank">
				<label>选择银行：</label>
				<div class="recharge-bank">
					<!-- 中国工商银行 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" checked value="0000000000">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/ICBC.png">
						</p>					
					</div>
					<!-- 中国建设银行 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" value="0801050000">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/CCB.png">
						</p>					
					</div>
					<!-- 中国民生银行 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" value="0803050000">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/CMBC.png">
						</p>
					</div>
					<!-- 中国光大银行 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" value="0803030000">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/CEB.png">
						</p>
					</div>
					<!-- 华夏银行 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" value="0803040000">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/HXB.png">
						</p>
					</div>
					<!-- 招商银行 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" value="0803080000">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/CMB.png">
						</p>					
					</div>
					<!-- 中国银行 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" value="0801040000">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/BOC.png">
						</p>
					</div>
					<!-- 交通银行 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" value="0803010000">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/BOCM.png">
						</p>
					</div>
					<!-- 上海浦东发展银行 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" value="0803100000">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/SPDB.png">
						</p>
					</div>
					<!-- 兴业银行 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" value="0803090000">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/CIB.png">
						</p>
					</div>
					<!-- 中信银行 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" value="0803020000">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/CITIC.png">
						</p>
					</div>
					<!-- 广东发展银行 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" value="0803060000">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/CGB.png">
						</p>
					</div>
					<!-- 平安银行 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" value="0804100000">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/PAYH.png">
						</p>					
					</div>
					<!-- 中国邮政 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" value="0801000000">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/PSBC.png">
						</p>
					</div>
					<!-- 中国农业银行 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" value="0801030000">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/ABC.png">
						</p>
					</div>
					<!-- 上海银行 -->
					<div class="recharge-bank-list">
						<input type="radio" name="bankCode" value="080401001C">
						<p class="bank-icon">
							<img src="${cdnServer}/static/weipaidai/images/bank/SHBANK.png">
						</p>
					</div>
				</div>
			</div>
			<div class="form-bank" style="display: none;">
				<div class="form-group" style="height: auto;">
					<label>绑定银行：</label>
					<div class="binding-bank">
						<img data-src="" class="bdbankimg1">
						<span class="recharge-wh">尾号<em class="rechargewh"></em></span>
						<p class="recharge-desc"><img src="${cdnServer}/static/weipaidai/images/safety03.png" class="tipsimg">单笔限额<span class="dbxe"></span> 单日限额<span class="drxe"></span>元  当日剩余充值额度<span class="syxe"></span>元</p>	
					</div>
				</div>
				<div class="form-group">
					<label>交易密码：</label><input type="password" class="pwd-input" maxlength="6" datatype="*" ignore="ignore" nullmsg="请输入交易密码" sucmsg=" " errormsg='交易密码为6位数字' autocomplete="off">
					<input type="password" name="pay_pwd" class="hide" id="pwd_md5">
				</div>
			</div>
			<div class="form-group form-button">
				<button class="recharge-button" id="sureBtn" disabled="true">确认充值</button>
			</div>
			<div class="form-group">
				<div class="recharge-rule">
					<p class="rule-tit"><i></i>充值规则</p>
					<p>1. 在向电子账户转账时，必须为银行借记卡，平台暂不支持存折、信用卡转账。</p>
					<p>2. 根据银行收费标准，在转账过程中可能会收取费用。平台目前不收取任何手续费。</p>
					<p>3. 通过ATM机转账，要24小时后才能到账。</p>
				</div>
			</div>
		</form>		
	</div>
</div>
<%@ include file="../common/accountfooter.jsp"%>

