<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_account.css?v=${version}" />
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/user_vip.css?v=${version}" />
<script type="text/javascript">
	var OP_CONFIG={"page":"page/user_vip"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 会员中心 -->
<div id="content">
	<div class="cont1200 clearfix" style="height: 1770px;">
		<%@ include file="user_menu.jsp"%>
		<div class="contentright fl">
			<div class="viphead">
				<div class="viphead1 clearfix">
					<div class="viphead01 clearfix">
						<p class="viphead001 fl">VIP等级：</p>
						<div class="vipliimg fl active">
							<div class="vip-icon" id="vipgrade">V<sub>1</sub></div>
						</div>
					</div>
					<div class="vip-line">
						<div class="hengxian"><div class="hongxian progress" data-width="0"></div></div>
					</div>
					<div class="vip-ul">
						<div class="vip-list active">
							<div class="vip-icon">V<sub>1</sub></div>
							<p class="vip-title">水钻</p>
							<div class="liqu liqu1">
								<p class="num">+50</p>
								<p class="numbutton numbutton1" data-id="1">领取</p>
							</div>
						</div>
						<div class="vip-list">
							<div class="vip-icon">V<sub>2</sub></div>
							<p class="vip-title">白钻</p>
							<div class="liqu liqu2">
								<p class="num">+100</p>
								<p class="numbutton numbutton2" data-id="2">领取</p>
							</div>
						</div>
						<div class="vip-list">
							<div class="vip-icon">V<sub>3</sub></div>
							<p class="vip-title">黄钻</p>
							<div class="liqu liqu3">
								<p class="num">+200</p>
								<p class="numbutton numbutton3" data-id="3">领取</p>
							</div>
						</div> 
						<div class="vip-list">
							<div class="vip-icon">V<sub>4</sub></div>
							<p class="vip-title">绿钻</p>
							<div class="liqu liqu4">
								<p class="num">+400</p>
								<p class="numbutton numbutton4" data-id="4">领取</p>
							</div>
						</div>
						<div class="vip-list">
							<div class="vip-icon">V<sub>5</sub></div>
							<p class="vip-title">蓝钻</p>
							<div class="liqu liqu5">
								<p class="num">+800</p>
								<p class="numbutton numbutton5" data-id="5">领取</p>
							</div>
						</div>
						<div class="vip-list">
							<div class="vip-icon">V<sub>6</sub></div>
							<p class="vip-title">粉钻</p>
							<div class="liqu liqu6">
								<p class="num">+1600</p>
								<p class="numbutton numbutton6" data-id="6">领取</p>
							</div>
						</div>
						<div class="vip-list">
							<div class="vip-icon">V<sub>7</sub></div>
							<p class="vip-title">红钻</p>
							<div class="liqu liqu7">
								<p class="num">+3200</p>
								<p class="numbutton numbutton7" data-id="7">领取</p>
							</div>
						</div>
						<div class="vip-list">
							<div class="vip-icon">V<sub>8</sub></div>
							<p class="vip-title">紫钻</p>
							<div class="liqu liqu8">
								<p class="num">+6400</p>
								<p class="numbutton numbutton8" data-id="8">领取</p>
							</div>
						</div>
						<div class="vip-list">
							<div class="vip-icon">V<sub>9</sub></div>
							<p class="vip-title">黑钻</p>
						</div>
					</div>
				</div>
			</div>
			<p class="vipdesc">您当前的成长值为<em class="growValue"></em>还差<em class="hcValue"></em>点到达<em class="vipdj"></em>等级</p>
			<img src="${cdnServer}/static/weipaidai/images/vip01.jpg">
			<p class="vip01">关于会员说明</p>
			<div class="vip02">
				<div class="vip03 clearfix vip04">
					<div class="vip02left fl">1</div>
					<div class="vip02right fl">微拍贷会员级别共分为9个等级，从V1到V9，分别为九种钻卡。</div>
				</div>
				<div class="vip03 clearfix">
					<div class="vip02left fl">2</div>
					<div class="vip02right fl">微拍贷会员等级由成长值决定，成长值越高会员等级越高，享受到的会员权益越多。</div>
				</div>
				<div class="vip03 clearfix">
					<div class="vip02left fl">3</div>
					<div class="vip02right fl">注册、实名认证、签到可获得相应的成长值。</div>
				</div>
				<div class="vip03 clearfix">
					<div class="vip02left fl">4</div>
					<div class="vip02right fl">每笔投资成功后，即获得成长值（累计折标投资金额数=成长值）；另首次投资，且成功投资1年期及以上产品，
                    可获得1.2倍成长值。（若首次投资，且投资一年期以下产品按照投资获得相应的成长值）</div>
				</div>
				<div class="vip03 clearfix">
					<div class="vip02left fl">5</div>
					<div class="vip02right fl">邀请好友实名注册、投资均可获得相应的成长值。</div>
				</div>
				<div class="vip03 clearfix">
					<div class="vip02left fl">6</div>
					<div class="vip02right fl">其他特定任务完成也可获得成长值。</div>
				</div>
			</div>
			<img src="${cdnServer}/static/weipaidai/images/vip02.jpg" class="vip05">
			<div class="vtable">
				<ul class="vtbody clearfix">
					<li class="vtd vtd01">成长任务</li>
					<li class="vtd vtd02">获得成长值</li>
					<li class="vtd vtd03">操作</li>
				</ul>
				<ul class="li_tbody clearfix">
					<li class="li_td vtd01">注册</li>
					<li class="li_td vtd02">+100成长值</li>
					<li class="li_td vtd03 li_1">
						
					</li>
				</ul>
				<ul class="li_tbodynew clearfix">
					<li class="li_td vtd01">实名认证</li>
					<li class="li_td vtd02">+500成长值</li>
					<li class="li_td vtd03 li_2">
						
					</li>
				</ul>
				<ul class="li_tbody clearfix">
					<li class="li_td vtd01 greyColor">签到</li>
					<li class="li_td vtd02 greyColor">+5/次成长值</li>
					<li class="li_td vtd03">
						<a href="javascript:void(0);" class="vtd06 greybg" onclick="G.$alert('功能暂未实现，请稍候！','info');">去签到</a>
					</li>
				</ul>
				<ul class="li_tbodynew clearfix">
					<li class="li_td vtd01">首次投资（一年期及以上产品）</li>
					<li class="li_td vtd02">x1.2倍成长值</li>
					<li class="li_td vtd03">
						<a href="/invest" class="vtd06">去投资</a>
					</li>
				</ul>
				<ul class="li_tbody clearfix">
					<li class="li_td vtd01">好友投资</li>
					<li class="li_td vtd02">+邀请好友累计折标投资金额数(元)*0.5</li>
					<li class="li_td vtd03">
						<a href="/user/invite" class="vtd06">去邀请</a>
					</li>
				</ul>
				<ul class="li_tbodynew clearfix">
					<li class="li_td vtd01">邀请好友实名注册</li>
					<li class="li_td vtd02">+500成长值</li>
					<li class="li_td vtd03">
						<a href="/user/invite" class="vtd06">去邀请</a>
					</li>
				</ul>
				<ul class="li_tbody clearfix">
					<li class="li_td vtd01 greyColor">风险测评</li>
					<li class="li_td vtd02 greyColor">+10微币</li>
					<li class="li_td vtd03">
						<a href="javascript:void(0);" class="vtd06 greybg" onclick="G.$alert('功能暂未实现，请稍候！','info');">去测评</a>
					</li>
				</ul>
			</div>
			<div class="vtable1">
				<ul class="vtbody1">投资获得相应成长值</ul>
				<ul class="li_tbody1 clearfix">
					<li class="li_tdx li_tdx1">风险测评</li>
					<li class="li_tdx li_tdx2">微+1</li>
					<li class="li_tdx li_tdx2">微+3</li>
					<li class="li_tdx li_tdx2">微+6</li>
					<li class="li_tdx li_tdx2">微月盈1</li>
					<li class="li_tdx li_tdx2">微月盈2</li>
					<li class="li_tdx li_tdx2">微月盈3</li>
					<li class="li_tdx li_tdx2">微年利1</li>
					<li class="li_tdx li_tdx2">微年利2</li>
					<li class="li_tdx li_tdx2">微年利3</li>
				</ul>
				<ul class="li_tbody1new clearfix">
					<li class="li_tdx li_tdx1">折标系数</li>
					<li class="li_tdx li_tdx2">1/12</li>
					<li class="li_tdx li_tdx2">1/4</li>
					<li class="li_tdx li_tdx2">1/2</li>
					<li class="li_tdx li_tdx2">1</li>
					<li class="li_tdx li_tdx2">2</li>
					<li class="li_tdx li_tdx2">3</li>
					<li class="li_tdx li_tdx2">1</li>
					<li class="li_tdx li_tdx2">2</li>
					<li class="li_tdx li_tdx2">3</li>
				</ul>
				<ul class="li_tbody1 clearfix">
					<li class="li_tdx li_tdx1">例子</li>
					<li class="li_tdx li_tdx2">1/12</li>
					<li class="li_tdx li_tdx2">1/4</li>
					<li class="li_tdx li_tdx2">1/2</li>
					<li class="li_tdx li_tdx2">1</li>
					<li class="li_tdx li_tdx2">2</li>
					<li class="li_tdx li_tdx2">3</li>
					<li class="li_tdx li_tdx2">1</li>
					<li class="li_tdx li_tdx2">2</li>
					<li class="li_tdx li_tdx2">3</li>
				</ul>
			</div>
		</div>	
	</div>
</div>
<%@ include file="../common/accountfooter.jsp"%>