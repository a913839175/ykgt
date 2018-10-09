<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/mall_meta.jsp"%>
<link rel="stylesheet" href="/static/weipaidai/css/mall/item.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"mall/item"};
</script>
<%@ include file="../common/mall_header.jsp"%>
<!-- 微商城-详情页 -->
<div id="content">
    <div class="breaditem">
        <ul class="breadcrumb">
            <li><a href="/mall">首页</a><i>></i></li>
            <li><a href="javascript:void(0);">${productDetail.product.cname}</a><i>></i></li>
            <li><a href="javascript:void(0);">${productDetail.product.name}</a></li>
        </ul>
    </div>
    <div id="detail">
        <div class="detail-cont">
            <div id="J_DetailMeta">
                <div class="item-left">
                    <div class="item-pic">
                        <img data-src="${productDetail.product.img}" name="pic">

                    </div>
                    <div class="item-thumbnail">
                        <ul>
                            <li class="active">
                                <img data-src="${productDetail.product.img}">
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="item-right">
                    <form id="itemForm" action="/mall/ordersubmit" method="post" onkeydown="if(event.keyCode==13){return false;}">       
                        <p class="item-title">${productDetail.product.name}</p>
                        <p class="item-desc"></p>
                        <div class="item-price">
                            <p class="item-yjprice">所需微币：<del>${productDetail.product.price}</del></p>
                            <p class="item-zkprice">折扣后：<span>${productDetail.product.discountPrice}</span></p>
                        </div>
                        <!-- <div class="sel-options sel-size">
                            <label>选择尺码：</label>
                            <div class="sel-btns">
                                <a class="sel-button active"><span>M码<i>已选中</i></span></a>
                                <a class="sel-button"><span>L码<i>已选中</i></span></a>
                            </div>
                        </div>
                        <div class="sel-options sel-color">
                            <label>选择颜色：</label>
                            <div class="sel-btns">
                                <a class="sel-button active"><span>蓝色<i>已选中</i></span></a>
                                <a class="sel-button"><span>白色<i>已选中</i></span></a>
                            </div>
                        </div> -->
                        <div class="sel-options sel-num">
                            <label>选择数量：</label>
                            <div class="sel-inputs">
                                <input type="hidden" name="sid" value="${sid}">
                                <input type="hidden" name="pic" value="${productDetail.product.img}" >
                                <input type="hidden" name="title" value="${productDetail.product.name}" >
                                <input type="hidden" name="price" value="${productDetail.product.discountPrice}" id="itemPrice">
                                <input type="hidden" name="store" value="${productDetail.product.store}" id="itemStore">                              
                                <input type="text" name="num" class="amount-input" value="1" maxlength="5" title="请输入购买量" autocomplete="off">
                                <span class="amount-btn">
                                    <em class="amount-sp amount-increase"></em>
                                    <em class="amount-sp amount-decrease disabled"></em>
                                </span>
                                <span class="amount-unit">件</span>
                                <em class="amount-stock"> （库存${productDetail.product.store}件）</em>
                            </div>
                        </div>
                        <div class="buy-button">                                                      
                            
                            <c:if test="${empty userinfo.user_name}">
                                <a class="button-link" href="javascript:void(0);" onclick="G.goLogin()">立即购买</a>                        
                            </c:if>
                            <c:if test="${not empty userinfo.user_name}">
                                <button class="button-link" id="J_LinkBuy">立即购买</button>
                            </c:if>
                            <p class="mywb">我的微币：<em id="currency">${currency.credit}</em></p>
                        </div>
                    </form>
                </div>
            </div>
            <div id="J_ShopPromtion">
                <div class="J_DetailPro">
                    <h2 class="pro-nav"><span>产品详情</span></h2>
                    <div id="description">
                        <div class="des-content">
                            ${wpd:replaceAllStr(productDetail.product.detail,"http://192.168.1.74","https://www.weipaidai.com/api/bpng")}
                        </div>
                    </div>
                </div>
                <!-- <div class="J_Recommend">
                    <h2 class="recommend-tit">推荐产品</h2>
                    <div class="recommend-item">
                        <ul class="pro-boxs">
                            <li>
                                <a href="#" target="_blank">
                                    <img src="/static/weipaidai/images/mall/listpic_03.png">
                                    <p class="pro-list-title">美图 M6s（MP1512）4GB</p>
                                    <p class="pro-list-wb"><span>21520微币</span></p>
                                    <button class="pro-list-btn">立即兑换</button>
                                </a>
                            </li>
                            <li>
                                <a href="#" target="_blank">
                                    <img src="/static/weipaidai/images/mall/listpic_03.png">
                                    <p class="pro-list-title">美图 M6s（MP1512）4GB</p>
                                    <p class="pro-list-wb"><span>100微币</span></p>
                                    <button class="pro-list-btn">立即兑换</button>
                                </a>
                            </li>
                            <li>
                                <a href="#" target="_blank">
                                    <img src="/static/weipaidai/images/mall/listpic_03.png">
                                    <p class="pro-list-title">美图 M6s（MP1512）4GB</p>
                                    <p class="pro-list-wb"><span>2000微币</span></p>
                                    <button class="pro-list-btn">立即兑换</button>
                                </a>
                            </li>
                            <li>
                                <a href="#" target="_blank">
                                    <img src="/static/weipaidai/images/mall/listpic_03.png">
                                    <p class="pro-list-title">美图 M6s（MP1512）4GB</p>
                                    <p class="pro-list-wb"><span>2000微币</span></p>
                                    <button class="pro-list-btn">立即兑换</button>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div> -->
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>