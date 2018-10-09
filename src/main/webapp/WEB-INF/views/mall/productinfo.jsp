<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/mall_meta.jsp"%>
<link rel="stylesheet" href="/static/weipaidai/css/mall/productinfo.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"mall/productinfo"};
</script>
<%@ include file="../common/mall_header.jsp"%>
<!-- 商品分类 -->

<div id="content">
    <div class="maincontent">
        <input type="hidden" value="${id}" id="gdid">
        <p class="protitle"><a href="/mall" class="index">首页</a> > 产品详情</p>
        <div class="probanner"></div>
        <!-- <div class="promain hide">
            <div class="proclassify clearfix">
                <p class="proclassifyms fl">分类：</p>
                <ul class="proclassifyul clearfix fl ">
                    <p class="proclassifyp01 fl">全部</p>
                    <li class="fl proclassifyli">油</li>
                    <li class="fl proclassifyli">米</li>
                    <li class="fl proclassifyli">礼盒</li>
                </ul>
            </div>
            <div class="proclassify02 clearfix">
                <p class="proclassifyms fl">配送地区：</p>
                <ul class="proclassifyul clearfix fl">
                    <p class="proclassifyp01 fl">全部</p>
                    <li class="fl proclassifyli">江浙沪</li>
                    <li class="fl proclassifyli">其他</li>
                </ul>
            </div>
        </div> -->
        <div class="infomain">
            <div class="infotitlez">
            </div>
        </div>
    </div>
</div>
<!-- 小圆圈 -->
<div class="ui-goTop"></div>
<%@ include file="../common/footer.jsp"%>