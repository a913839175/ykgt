<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<script type="text/javascript">
    var OP_CONFIG = {"page":""};
</script>
<%@ include file="../common/header.jsp"%>
    <div id="content">     
        <div class="mask" id="mask"> 
        	<div class="pop" id="J_alert_box"> 
	        	<h3  class="pop-title">充值提示<span class="pop-close" id="pop_box_close"></span></h3> 
	        	<div class="pop-main pop-tips"> 
	        		<h3 class="pop-tips-center">
	        			<c:if test="${order_pay_code == '0000'}">你已成功充值${order_amt}元</c:if>
	        			<c:if test="${order_pay_code != '0000'}">充值失败！</c:if>
	        		</h3>
	        		<em class="icon-true"></em>
	        		<a href="/user/account"><input type="button" class="next-step mt-40" value="确定" id="pop_box_sure"/></a>
	        	</div>
        	</div>
        </div>
    </div>
<%@ include file="../common/footer.jsp"%>

