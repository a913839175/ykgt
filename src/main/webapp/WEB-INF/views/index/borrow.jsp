<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/borrow.css?v=${version}" />
<script type="text/javascript">
	var OP_CONFIG={"page":"page/borrow"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 我要借款 -->
   <div id="content" class="borrow">
 	   <!-- banner图 -->
   	<div class="borrowbanner"></div>
   		<ul class="borrowp-ul clearfix">
   			<li class="borrowp-li fl clearfix mal30">
   				<img src="${cdnServer}/static/weipaidai/images/borrow01.png" class="borrowpliimg01 fl">
   				<div class="borrowplims1 fl">
   					<p class="borrowplims2">快速审批</p>
   					<p class="borrowplims3">在线完成审批</p>
   				</div>
   			</li>
   			<li class="borrowp-li fl clearfix">
   				<img src="${cdnServer}/static/weipaidai/images/borrow02.png" class="borrowpliimg01 fl">
   				<div class="borrowplims4 fl">
   					<p class="borrowplims2">超低利息</p>
   					<p class="borrowplims3">费率最低可至0.04%/天</p>
   				</div>
   			</li>
   			<li class="borrowp-li fl clearfix">
   				<img src="${cdnServer}/static/weipaidai/images/borrow03.png" class="borrowpliimg01 fl">
   				<div class="borrowplims5 fl">
   					<p class="borrowplims2">多种额度</p>
   					<p class="borrowplims3">灵活定制产品</p>
   				</div>
   			</li>
   			<li class="borrowp-li fl clearfix">
   				<img src="${cdnServer}/static/weipaidai/images/borrow04.png" class="borrowpliimg01 fl">
   				<div class="borrowplims6 fl">
   					<p class="borrowplims2">信息安全</p>
   					<p class="borrowplims3">借款全程受法律保护</p>
   				</div>
   			</li>
   		</ul>
   	<!-- 借款种类 -->
   	<div class="borrspecies">
   		<div class="borrspeciesc">
   			<div class="borrspms1 clearfix">
	   			<p class="fl borrspp3">申请借款</p>
   			</div>
            <div class="borrow-box">
               <div class="borrow-form">
                  <div class="dlerror"></div>
                  <div class="form-group">
                     <label>借款金额</label>
                     <input id="account" type="text" name="account" class="form-input" placeholder="请输入借款金额" datatype="*" sucmsg="&nbsp;" nullmsg="借款金额不能为空">
                     <p class="accountms">元</p>
                     <span class="form-span">最高借款金额20万</span>
                  </div>
                  <div class="form-group">
                     <label>借款周期</label>
                     <input id="loan_type" type="text" name="loan_type" class="form-input" placeholder="请输入借款周期" datatype="*" sucmsg="&nbsp;" nullmsg="借款周期不能为空" maxlength="5">
                     <p class="accountms">天</p>
                     <span class="form-span">借款周期不能超过3年</span>
                  </div>
                  <div class="form-group">
                     <label>联系方式</label>
                     <input id="phone" type="text" name="phone" class="form-input" placeholder="请输入手机号码" datatype="m" sucmsg="&nbsp;"  errormsg="手机号码格式错误"  nullmsg="手机号码不能为空" autocomplete="off"  maxlength="11">
                  </div>
                  <div class="form-group form-use">
                     <label>用途说明</label>
                     <textarea id="loan_use_desc" type="text" name="loan_use_desc" class="form-textarea" placeholder="请输入借款用途"></textarea>
                  </div>
                  <button type="button" class="form-button" id="formButton">提交申请</button>
               </div>
            </div>
   		</div>
         <input type="hidden" class="total">
         <div class="FAQ">
            <div class="faqc">
               <p class="faqcms1">常见问题</p>
               <p class="faqcms2">你有问题，我们有解答</p>
               <ul class="faqc_ul clearfix mrt40 mrb38">
                  <li class="faqc_li  fl">
                     <p class="faqc_liwz1">借款审核一般需要多长时间？</p>
                     <p class="faqc_liwz2">借款资料提交成功后，工作人员会在 2 个工作日内进行审核，审核结果会以电话的形式通知。</p>
                  </li>
                  <li class="faqc_li  fr">
                     <p class="faqc_liwz1">借款额度是多少？</p>
                     <p class="faqc_liwz2">不同的借款产品额度范围有一定差别，各产品详情页中有详细说明。</p>
                  </li>
               </ul>
               <ul class="faqc_ul clearfix">
                  <li class="faqc_li  fl">
                     <p class="faqc_liwz1">还款方式有哪些？</p>
                     <p class="faqc_liwz2">目前根据不同的借款产品支持一次性还本付息，每月付息到期还本、等额本息、等本等息等还款方式。</p>
                  </li>
                  <li class="faqc_li  fr">
                     <p class="faqc_liwz1">借款需要支付哪些费用？</p>
                     <p class="faqc_liwz2">借款人借款成功后需要支付给投资人的利息费用，以及支付给团贷网平台和团贷网平台合作伙伴的服务费用。</p>
                  </li>
               </ul>
               <p class="faqc_liwz3">有更多问题？请查看<a href="/help/required">帮助中心</a></p>
            </div>
         </div>
   	</div>
 </div> 
<%@ include file="../common/footer.jsp"%>

