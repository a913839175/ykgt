<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/mall_meta.jsp"%>
<link rel="stylesheet" href="/static/weipaidai/css/mall/index.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"mall/index"};
</script>
<%@ include file="../common/mall_header.jsp"%>
<!-- 微商城 3月1日开启，此处已隐藏-->
<div id="content" class="hide">
    <div class="mainbox">
        <!-- 侧边栏 -->
        <div class="main-sidebar">
            <ul class="main-sidebar-ul">
                <li class="all">
                    <a href="javascript:void(0);">全部分类</a>
                </li>
                <li class="hide">
                    <div class="main-sidebar-list">
                        <em><img data-src="/static/weipaidai/images/mall/cfdq.png"></em>数码电器<i></i>
                    </div>
                    <div class="main-sidebar-wrapper">
                        <div class="list-a-panel">
                            <span class="list-a-title"><a>手机<em></em></a></span>
                            <a>华为 MATE 9</a><a>小米 MAX2</a><a>IPHONE 8</a><a>IPHONE 8 PLUS</a><a>IPHONE X</a><br/>
                            <span class="list-a-null"></span><a>美图 M6s（MP1512）</a><a>小米 MAX2</a><a>IPHONE 7</a><a>IPHONE 7 PLUS</a><a>小米5X</a>
                        </div>
                        <div class="list-a-panel">
                            <span class="list-a-title"><a>电脑<em></em></a></span>
                            <a>APPLEMACBOOK AIR笔记本</a><a>APPLE IMAC 21.5英式一体机</a>
                        </div>
                        <div class="list-a-panel">
                            <span class="list-a-title"><a>电源<em></em></a></span>
                            <a>小米（MI）移动电源</a><a>小米移动电源 白色</a>
                        </div>
                        <div class="list-a-panel">
                            <span class="list-a-title"><a>音箱<em></em></a></span>
                            <a>小米小钢炮</a><a>小米互联网智能WIFI网络音箱</a>
                        </div>
                        <div class="list-a-panel">
                            <span class="list-a-title"><a>其他<em></em></a></span>
                            <a>KINDLE PAPERWHITE</a><a>小米互联网智能WIFI网络音箱</a>
                        </div>             

                    </div>       
                </li>
                <c:forEach var="items" items="${productList.lists}">
                    <c:if test="${items.cid != 0}">
                        <a href="/mall/productinfo/${items.cid}"><li>
                            <div class="main-sidebar-list">
                                <em><img src="/static/weipaidai/images/mall/cfdq.png" class="lazy"></em>${items.cname}<i></i>
                            </div>
                        </li></a>
                    </c:if>
                </c:forEach> 
            </ul>
        </div>
        <!-- banner -->
        <div class="main-banner">
            <div class="flexslider">
                <ul class="slides">
                    <c:forEach var="items" items="${bannerList.lists}">
                        <li style="background: transparent url(${items.webUrl}) 50% 0 no-repeat;">
                            <c:if test="${items.islink == '1'}">
                                <a href="${items.webH5Url}" target="_blank"></a>
                            </c:if>
                        </li>
                    </c:forEach> 
                </ul>
            </div>
        </div>
        <!-- info -->
        <div class="main-info">
            <img src="/static/weipaidai/images/mall/mall01.png" class="infobj lazy">
            <c:if test="${empty userinfo.user_name}">
                <p class="info01">登录后显示微币</p>
                <a href="/user/login?redirectURL=/mall" class="info02">立即登录</a>
            </c:if>
            <c:if test="${not empty userinfo.user_name}">
                <p class="info01">Hi!${userinfo.user_name}</p>
                <a href="/mall/orderlist"><div class="exchangez">
                    <img src="/static/weipaidai/images/mall/mall06.png" class="exchangezimg">
                    <span class="exchangezwz">兑换记录</span>
                </div></a>
                <div class="mallmore clearfix">
                    <div class="info03">
                        <img data-src="/static/weipaidai/images/mall/mall02.png" class="info04 fl lazy">
                        <p class="info05 fl">目前您拥有<span id="iwb"><c:if test="${currency.credit > 0}">${currency.credit}</c:if><c:if test="${currency.credit <= 0}">0</c:if></span>微币</p>
                    </div>
                    <a href="/mall/wbrecord"><img data-src="/static/weipaidai/images/mall/mall07.png" class="lazy mallmoreimg"></a>
                </div>
            </c:if>
            <ul class="info_ul clearfix">
                <li class="info_li fl info_lit1 info_liactive" data-cid = "0">
                    <img data-src="/static/weipaidai/images/mall/mall03.png" class="info_li01 lazy">
                    <p class="info_li04">现金红包</p>
                </li>
                <li class="info_li fl info_lit2" data-cid = "2">
                    <img data-src="/static/weipaidai/images/mall/mall04.png" class="info_li02 lazy">
                    <p class="info_li04">投资红包</p>
                </li>
                <li class="info_li fl info_lit3" data-cid = "1">
                    <img data-src="/static/weipaidai/images/mall/mall05.png" class="info_li03 lazy">
                    <p class="info_li04">加息红包</p>
                </li>
            </ul>
            <div class="info06">
                <div class="select myselect">
                    <p class="select-option" id="selecto1" data-select='1'></p>
                    <div class="select-selectbtn"></div>
                    <ul class="select-ul hbList" id="sul1">
                    </ul>
                    <div class="jf_xuanze2 clearfix">
                        <p class="jf_sanjijianhao" id="jianlang">-</p>
                        <input type="text" autocomplete="off" class="jf_sanjinum" disabled="disabled">
                        <p class="jf_sanjijiahao" id="jialang">+</p>
                        <p class="jf_kc">(库存<span id="ikc"></span>件)</p>
                    </div>
                    <p class="info07">所需微币：<span id="weibz"></span></p>
                    <div class="info08 clearfix">
                        <button class="info09 fl">立即兑换</button>
                        <a href="#" class="info10 fl">使用说明</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 推荐产品 -->
    <div class="recommend-pro">
        <h2 class="pro-title">推荐产品</h2>
        <ul class="pro-items">
            <c:forEach var="items" items="${productList.lists}">
                <c:if test="${items.cid == 0}">
                    <c:forEach var="items2" items="${items.products}">
                        <li>
                            <a href="/mall/item?sid=${items2.id}" target="_blank" data-id="${items2.id}">
                                <img data-src="${items2.img}" class="lazy">
                                <p class="pro-list-title">${items2.name}</p>
                                <p class="pro-list-wb"><span>${items2.price}微币</span></p>
                            </a>
                        </li>

                    </c:forEach>
                </c:if> 
            </c:forEach> 
        </ul>
    </div>
    <!-- 数码电器 -->
    <c:forEach var="items" items="${productList.lists}">
        <c:if test="${items.cid != 0}">
            <div class="recommend-pro">
                <h2 class="pro-title">
                    <span>${items.cname}</span>
                    <span class="pro-title-right">
                        <a href="/mall/productinfo/${items.cid}" target="_blank" class="ckmore" data-cid="${items.cid}">查看更多>></a>  
                    </span>
                </h2>
                <ul class="pro-boxs">
                    <c:forEach var="items2" items="${items.products}" begin="0" end="7">
                        <li>
                            <a href="/mall/item?sid=${items2.id}" target="_blank">
                                <div class="pro-boxsbj">
                                    <img data-src="${items2.img}" class="lazy">
                                </div>
                                <p class="pro-list-title">${items2.name}</p>
                                <p class="pro-list-wb"><span>${items2.price}微币</span></p>
                                <button class="pro-list-btn">立即兑换</button>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </c:forEach> 
    <!-- 使用说明 -->
    <div class="max1 mask">
        <div class="instructions">
            <p class="instructionsp1 mart100"><span>现金红包使用规则：</span>用户在红包账户中点击使用现金红包后，用户存管账户中将获得对应金额，用户可直接投资或提现。</p>
            <p class="instructionsp1 mart25"><span>投资红包使用规则：</span>用户投资时使用投资红包，当用户投资满足红包使用条件时，投资成功标的全部满标放款后，用户存管账户中将获得对应金额，用户可直接投资或提现。</p>
            <p class="instructionsp1 mart25"><span>加息红包使用规则：</span>用户投资时选择加息红包，最终用户收益利率为用户投资产品标的利率加上加息红包利率。。</p>
            <button class="sureinstr"></button>
        </div>
    </div>
</div>
<div class="maintain">
    <div class="malldefind"></div>
</div>
<%@ include file="../common/footer.jsp"%>