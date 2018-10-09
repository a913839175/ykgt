<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<script type="text/javascript">
	var OP_CONFIG = {"page":""};
</script>
<%@ include file="../common/header.jsp"%>
<!--支付网关测试环境地址：http://www-1.fuiou.com:8888/wg1_run/smpGate.do-->

<!--支付网关生产环境地址：https://pay.fuiou.com/smpGate.do-->
<div id="content">
   	 <div class="bscg-loading"></div>
   	 <c:if test="${recharge.returnCode == '1'}">
	 <div class="form">
		 <c:if test="${pay_type == '0'}">
		     <form name="pay" method="post" action="http://www-1.fuiou.com:8888/wg1_run/smpGate.do" id="formdata">
				<input type="hidden" value="${rechargeData.md5}" name="md5"/>
				<input type="hidden" value="${rechargeData.mchnt_cd}" name="mchnt_cd"/>
				<input type="hidden" value="${rechargeData.order_id}" name="order_id"/>
				<input type="hidden" value="${rechargeData.order_amt}" name="order_amt"/>
				<input type="hidden" value="${rechargeData.order_pay_type}" name="order_pay_type"/>
				<input type="hidden" value="${rechargeData.page_notify_url}" name="page_notify_url"/>
				<input type="hidden" value="${rechargeData.back_notify_url}" name="back_notify_url"/>
				<input type="hidden" value="${rechargeData.order_valid_time}" name="order_valid_time"/>
				<input type="hidden" value="${rechargeData.iss_ins_cd}" name="iss_ins_cd"/>
				<input type="hidden" value="${rechargeData.goods_name}" name="goods_name"/>
				<input type="hidden" value="${rechargeData.goods_display_url}" name="goods_display_url"/>
				<input type="hidden" value="${rechargeData.rem}" name="rem"/>
				<input type="hidden" value="${rechargeData.ver}" name="ver"/>
			</form>
		</c:if>
		<c:if test="${pay_type == '1'}">
			<form name="pay" method="post" action="http://www-1.fuiou.com:8888/wg1_run/dirPayGate.do" id="formdata">
				<input type="hidden" value="${rechargeData.RSA}" name="RSA"/> 
				<input type="hidden" value="${rechargeData.mchnt_cd}" name="mchnt_cd"/>
				<input type="hidden" value="${rechargeData.order_id}" name="order_id"/>
				<input type="hidden" value="${rechargeData.order_amt}" name="order_amt"/>
				<input type="hidden" value="0" name="user_type"/>
				<input type="hidden" value="${rechargeData.card_no}" name="card_no"/>
				<input type="hidden" value="${rechargeData.page_notify_url}" name="page_notify_url"/>
				<input type="hidden" value="${rechargeData.back_notify_url}" name="back_notify_url"/>
				<input type="hidden" value="${rechargeData.cert_type}" name="cert_type"/>
				<input type="hidden" value="${rechargeData.cert_no}" name="cert_no"/>
				<input type="hidden" value="${rechargeData.cardholder_name}" name="cardholder_name"/>
				<input type="hidden" value="${rechargeData.user_id}" name="user_id"/>
			 </form>
		</c:if>
	</div>
	<script type="text/javascript">document.getElementById("formdata").submit();</script>
	</c:if>
	<c:if test="${recharge.returnCode != '1'}">
		<script type="text/javascript">
			G.$alert("${recharge.returnMsg}",false, function() {
				window.location.href = '/user/recharge';
			});
		</script>
	</c:if>
</div>	
<%@ include file="../common/footer.jsp"%>

