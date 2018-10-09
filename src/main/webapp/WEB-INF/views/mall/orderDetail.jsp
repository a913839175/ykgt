<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/mall_meta.jsp"%>
<link rel="stylesheet" type="text/css" href="/static/weipaidai/css/mall/orderDetail.css?v=${version}">
<script type="text/javascript">
    var OP_CONFIG={"page":"mall/orderDetail"};
</script>
<%@ include file="../common/mall_header.jsp"%>
<!-- 订单列表 -->
<div id="content">
    <div class="maincontent">
        <div class="breaditem">
            <ul class="breadcrumb">
                <li><a href="/mall">首页</a><i>></i></li>
                <li><a href="javascript:void(0);">订单详情</a></li>
            </ul>
        </div>
        <div class="record-cont">
            <div class="record-thead">
                <span class="th-span1">宝贝</span>
                <span class="th-span2">数量</span>
                <span class="th-span2">实付微币</span>
                <span>订单状态</span>
            </div>
            <div class="record-tbody">
                <div class="record-list">
                    <div class="record-list-warp">
                        <div class="record-list-img">
                            <img src="${orderDetail.pimg}">
                        </div>
                        <div class="record-list-item">
                            <input type="hidden" value="${id}" id="orderId">
                            <p class="record-list-title">${orderDetail.pname}</p>
                        </div>
                        <p class="record-list-p record-list-num">${orderDetail.num}</p>
                        <p class="record-list-p record-list-wb">${orderDetail.detail}</p>
                        <p class="record-list-p record-list-status">${orderDetail.status}</p>                       
                    </div>                      
                </div>
            </div>
            <div class="order-info">
                <h2 class="order-list-time">订单信息<span>创建时间：${orderdate}</span></h2>
                <div class="order-info-cont">         
                    <p>收货地址：${address} </p>
                    <p>手机号码：${orderDetail.phone}  </p>
                    <p>收件人：${orderDetail.name}</p>
                    <div class="order-info-logistics">
                        <p>物流公司：<c:if test="${empty orderDetail.wuliu_name}">${orderDetail.status}</c:if> <c:if test="${not empty orderDetail.wuliu_name}">${orderDetail.wuliu_name}</c:if></p>
                        <p>物流单号：<c:if test="${empty orderDetail.wuliu_order}">${orderDetail.status}</c:if> <c:if test="${not empty orderDetail.wuliu_order}">${orderDetail.wuliu_order}</c:if></p>
                    </div>                
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>