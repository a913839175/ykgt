<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/mall_meta.jsp"%>
<link rel="stylesheet" href="/static/weipaidai/css/mall/ordersubmit.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"mall/ordersubmit"};
</script>
<%@ include file="../common/mall_header.jsp"%>
<!-- 提交订单 -->
<div id="content">
    <div class="maincontent">
        <div class="breaditem">
            <ul class="breadcrumb">
                <li><a href="/mall">首页</a><i>></i></li>
                <li><a href="javascript:void(0);">提交订单</a></li>
            </ul>
        </div>
         <div class="suremain">       
            <div class="smallmain">
                <div class="sureadddress clearfix">
                 <p class="sureadddress01 fl">确认收货地址</p>
                 <a class="sureadddress02 fr" href="/mall/manageaddr" target="_blank">管理收货地址 </a>
                </div>
                <ul class="addressz-ul" id="addressList">
               
                </ul>
                <button type="button" class="newaddress" id="J_addaddr">新增地址</button>
                <form action="/mall/orderconfirm" method="post">
                    <p class="sureadddress01">确认订单信息</p>
                    <div class="sureheader">
                        <div class="sureheader01 fl">兑换宝贝</div>
                        <div class="sureheader02 fl">微币</div>
                        <div class="sureheader03 fl">数量</div>
                        <div class="sureheader04 fl">小计</div>
                    </div>
                    <div class="sureinfoz clearfix">
                     <div class="sureinfo01 clearfix fl">
                         <img src="${pic}" class="sureinfo01img" >
                         <div class="sureinfo01_01">
                            <div class="sureinfo01_01top">${title}</div>
                            <div class="sureinfo01_01bottom"></div>
                         </div>
                     </div>
                     <p class="sureinfo02">${price}</p>
                     <div class="sureinfo03">
                         <button type="button" class="sureinfo03p01 <c:if test="${num <= 1}">disabled</c:if>">-</button>
                         <input  type="text" class="sureinfo03p02" name="count" value="${num}" maxlength="5" autocomplete="off">
                         <button type="button" class="sureinfo03p03 <c:if test="${num >= 10 || num >= store}">disabled</c:if>">+</button>
                     </div>
                     <p class="sureinfo04">${price*num}</p>
                    </div>
                    <div class="surexian"></div>
                    <div class="sureresult">
                        <div class="payInfo-wrapper">
                            <div class="payInfo-shadow">
                                <p><span class="realPay-title">实付微币：</span><span class="realPay-price">${price*num}</span></p>
                                <p><span class="realPay-title">寄送至：</span><span class="sureresultd2_01">${wpd:replaceAllStr(addressList.lists[0].address_code,"/"," ")} ${addressList.lists[0].detailed_address}</span></p>
                                <p><span class="realPay-title">收货人：</span><span class="sureresultd3_01">${addressList.lists[0].consignee} ${addressList.lists[0].con_phone}</span></p>
                                <input type="hidden" name="aid" value="${addressList.lists[0].id}" id="itemAid">
                                <input type="text" class="hide" value="${addressList.lists[0].id}" id="hideAid">
                                <input type="hidden" name="sid" value="${sid}">
                                <input type="hidden" name="store" value="${store}" id="itemStore">                                                
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="tjsure">提交订单</button>
                </form>                   
            </div>         
        </div>
    </div>   
</div>
<%@ include file="../common/footer.jsp"%>