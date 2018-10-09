<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/invest_detail.css?v=${version}" />
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/tip-yellowsimple.css?v=${version}" />
<script type="text/javascript">
    var OP_CONFIG={"page":"page/invest_detail"};
</script>
<%@ include file="../common/header.jsp"%>
<!-- 我要投资详情页 -->
<div id="content">
    <!-- banner图 -->
    <div class="page-banner" data-value="${borrowInfo}"></div>
    <div class="wyy clearfix">
        <input type="hidden" value="${type}" class="stype">
        <input type="hidden" class="nid" value="${nid}">
        <input type="hidden" class="paymoney" value="${detailList.payment_profit_coefficient}"> 
        <input type="hidden" class="productNid" value="${detailList.borrow_product_nid}">
        <input type="hidden" class="balance" value="${usermain.balance}">
        <input type="hidden" class="productname" value="${detailList.borrow_product_name}">
        <input type="hidden" class="Aubuam">
        <div class="wyyleft1 fl">
            <c:if test="${type == 'loan'}">
                <p class="wyyleftwz1">${detailList.loan_name}</p>
            </c:if>
            <c:if test="${type == 'shut'}">
                <p class="wyyleftwz1">${detailList.shut_name}</p>
            </c:if>     
            <div class="wyyleftwz2 clearfix">
                <div class="wyyfirst fl">
                    <p class="wyyfirst01"><span class="wyyfirst01span">${detailList.labor_year}</span>%</p>
                    <p class="wyyfirst02">预期利率</p>
                </div>
                <div class="wyysecond fl pat17 marl103">
                    <c:if test="${detailList.interest_type == 1}">
                        <p class="wyysecond01"><span class="wyysecond01span">${detailList.borrow_days}</span>天</p>
                    </c:if>
                    <c:if test="${detailList.interest_type == 2}">
                        <p class="wyysecond01"><span class="wyysecond01span">${detailList.borrow_period}</span>个月</p>
                    </c:if>
                    <c:if test="${detailList.interest_type == 3}">
                        <p class="wyysecond01"><span class="wyysecond01span">${detailList.borrow_years}</span>年</p>
                    </c:if>
                    <p class="wyyfirst02">项目期限</p>
                </div>
                <div class="wyytried fl pat17 marl103">
                    <p class="wyysecond01"><span class="wyysecond02span">${detailList.account}</span>元</p>
                    <p class="wyyfirst02">总金额</p>
                </div>
            </div>
            <div>
                <div class="progressz clearfix">
                    <div class="progress-bar fl">
                        <p id="progress-bar2" class="progress" data-width="${detailList.schedule}%"></p>
                    </div>
                    <p class="progress-bar2 fl">进度：<span class="progress-bar2span">${detailList.schedule}</span>%</p>
                </div>
            </div>
            <p class="wyy01">还款方式<span class="wyy01span">${detailList.repayment_methods}</span></p>
            <p class="wyy01">计息方式<span>满标结束后T+1日计息</span></p>
            <p class="wyy02">起投金额<span>100元</span></p>
        </div>
        <div class="xian fl"></div>
        <div class="wyyright1 fl tenderform">
            <c:if test="${empty userinfo.user_name}">
                <p class="limit_Accredit"></p>
                <p class="wyyright08">账户可用余额<c:if test="${type == 'loan'}"><a href="javascript:void(0);" onclick="G.goLogin();">登录</a></c:if><c:if test="${type == 'shut'}"><a href="javascript:void(0);" onclick="G.goLogin();">登录</a></c:if>后可见</p>
            </c:if>
            <c:if test="${not empty userinfo.user_name}">
                <p class="wyyright01">剩余可投：<span id="accwait">${detailList.account_wait}</span>元</p>
                <div class="wyyright02 clearfix">                
                    <p class="fl wyyright03">您的可用余额为：<span class="xqbalance">${usermain.balance}</span>元</p>
                    <a class="fr wyyright04 recharge" href="javascript:void(0);" target="_blank">充值</a>
                </div>
            </c:if>
            <c:if test="${detailList.schedule != '100.00'}">
                <div class="ui-term-field clearfix">
                    <input class="ui-term-input fl" type="text" nullmsg="请输入有效金额" errormsg="请投满此标或整百投资" datatype="isNumberBy100" sucmsg=" " placeholder="请投满此标或整百投资" maxlength="9">
                    <span class="Validform_checktip"></span>          
                    <p class="ui-term-inputunit">元 <span class="ui-term-eq share"></span></p>
                </div>
                <!--<p class="wyyright05" data-date="${detailList.payment_date}">到期日期：暂无</p>
                <p class="wyyright07">预期利率：0<span>元</span></p> -->
                <button class="speedsure" id="speedsure">立即投资</button>
            </c:if>
            <c:if test="${detailList.schedule == '100.00'}">
                <button class="ymb">已满标</button>
            </c:if>
        </div>
    </div>
    <c:if test="${type == 'shut'}">
        <!-- 精准投资 -->
        <div class="AccurateBt clearfix">
            <p class="AccurateBt01 fl">精准投资</p>
            <p class="AccurateBt02 fl"></p>
            <p class="AccurateBt03 fl">自主投资 期限灵活</p>
        </div>
        <!-- 精准投资列表 -->
        <ul class="AccurateList" id="AccurateList">
            
        </ul>
        <!-- 分页 -->
        <div class="page">
            <div class="M-box M-box1"></div>
        </div>
    </c:if>
    <div class="lcj_bigcontent clearfix">
        <div class="cpzs">
            <ul class="cpzs_ul" >
                <li class="cpzs_li bordercur">产品详细</li>
                <li class="cpzs_li" id="getmorefirst">投资记录</li>
            </ul>
            <div class="tab-cont cpzs_dyk">
                <c:if test="${type == 'shut'}">
                    <p class="cpzs_dykp1">项目详情</p>
                    <p class="cpzs_dykp2">微系列是元康国投推出的一项高效，灵活的优先自动投标工具。经由出借人授权，并由系统为出借人实现分散投标，节省投资时间、提高投资效率的投标产品。本产品精选优质债权，并在第三方机构承保的基础上，降低出借人投资风险。购买微系列产品之后，资金将自动进入锁定期。</p>
                </c:if>
                <p class="cpzs_dykp3">投资流程</p>          
                <p class="cpzs_dykp4">
                    <span>投资申请成功</span><i></i>
                    <span>满标后投资成功</span><i></i>
                    <span>满标后次日开始计息</span><i></i>
                    <span>到期日可提现</span>
                </p>
                <c:if test="${type == 'loan'}">
                    <p class="cpzs_dykp3_3">借款人基本信息</p>
                    <ul class="userinfo_ul">
                        <li class="on"><em>姓名</em><span><c:if test="${empty borrowInfo.user_name}">暂无</c:if>${borrowInfo.user_name}</span></li>
                        <li><em>性别</em><span><c:if test="${empty borrowInfo.sex}">暂无</c:if>${borrowInfo.sex}</span></li>
                        <li class="on"><em>年龄</em><span><c:if test="${empty borrowInfo.age}">暂无</c:if>${borrowInfo.age}</span></li>
                        <li><em>所在地</em><span><c:if test="${empty borrowInfo.native_place}">暂无</c:if>${borrowInfo.native_place}</span></li>
                        <li class="on"><em>借款用途</em><span><c:if test="${empty borrowInfo.borrow_use}">暂无</c:if>${borrowInfo.borrow_use}</span></li>
                        <li><em>身份证号码</em><span><c:if test="${empty borrowInfo.id_no}">暂无</c:if>${borrowInfo.id_no}</span></li>
                        <li class="on"><em>手机号</em><span><c:if test="${empty borrowInfo.mobile_phone}">暂无</c:if>${borrowInfo.mobile_phone}</span></li>
                        <li><em>税后收入</em><span><c:if test="${empty borrowInfo.income_at}">暂无</c:if>${borrowInfo.income_at}</span></li>
                        <li class="on"><em>职务名称</em><span><c:if test="${empty borrowInfo.duty_name}">暂无</c:if>${borrowInfo.duty_name}</span></li>
                    </ul>
                </c:if>
                <p class="cpzs_dykp3_3">收益计算公式</p>
                <p class="cpzs_dykp6"><em>按日计息：</em>预期收益=本金×预期利率×期限/365</p>
                <p class="cpzs_dykp6"><em>按月计息：</em>预期收益=本金×预期利率×期限/12</p>

                <p class="cpzs_dykp3">风险提示</p>
                <p class="cpzs_dykp6">市场有风险，投资需谨慎。请您在投资前，仔细阅读<a href="/news/detail/76" target="_blank">《元康国投风险提示书》</a>。</p>
                <p class="cpzs_dykp3">协议说明</p>
                <p class="cpzs_dykp6">请您在投资前，仔细阅读<a href="/news/detail/75" target="_blank">《元康国投投资服务协议》</a>。</p>

            </div>
            <div class="tab-cont tzr_bg">
                <table class="ui-table ui-table-thead">
                    <thead>
                        <tr>
                            <th width="17%"><span class="pl60">序号</span></th>
                            <th width="25%"><span class="pl25">投标人</span></th>
                            <th width="23%"><span class="text-right pr70">投标金额</span></th>
                            <th><span class="text-right pr90">投标时间</span></th>
                        </tr>
                    </thead>
                    <tbody id="Investorform"></tbody>
                </table>
                 <!-- 分页 -->
			    <div class="page2">
			        <div class="M-box M-box2"></div>
			    </div>
            </div>
        </div>  
    </div>
</div>
<c:if test="${not empty userinfo.user_name}">
    <!-- 投资详情弹层 -->
    <div class="max mask">
        <ul class="maxtz">
            <li class="suretz pat180 clearfix">
                <p class="suretz01 fl">产品名称：</p>
                <c:if test="${type == 'loan'}">
                    <p class="suretz02 fl">${detailList.loan_name}</p>
                </c:if>
                <c:if test="${type == 'shut'}">
                    <p class="suretz02 fl">${detailList.shut_name}</p>
                </c:if>
            </li>
            <li class="suretz2 clearfix detailListbox">
                <p class="suretz01 fl pat6">预期利率：</p>
                <p class="suretz03 fl" ><em class="detailListboxlist">${detailList.labor_year}</em><span>%</span></p>
            </li>
            <li class="suretz2 clearfix">
                <p class="suretz01 fl">投资期限：</p>
                <c:if test="${detailList.interest_type == 1}">
                    <p class="suretz02 fl">${detailList.borrow_days}<span class="qian">天</span></p>
                </c:if>
                <c:if test="${detailList.interest_type == 2}">
                    <p class="suretz02 fl">${detailList.borrow_period}<span class="qian">个月</span></p>
                </c:if>
                <c:if test="${detailList.interest_type == 3}">
                    <p class="suretz02 fl">${detailList.borrow_years}<span class="qian">年</span></p>
                </c:if>
            </li>

            <li class="suretz2 clearfix">
                <p class="suretz01 fl">投资金额：</p>
                <p class="suretz02 fl"><em class="transAmt">0</em><span class="qian">元</span><img src="${cdnServer}/static/weipaidai/images/investxq04.png" class="insertwenh" id="zdtdtip" title="超过剩余可投金额，数值自动变为剩余可投金额"></p>     
            </li>

            <li class="suretz clearfix">
                <p class="suretz01 fl">到期日期：</p>
                <p class="suretz02 fl">${detailList.payment_date}</p>
            </li>
            <div class="dashed"></div>
            <li class="suretz clearfix">
                <p class="suretz01 fl">使用红包：</p>
                <p class="suretz04 fl" id="znone1">暂无可用红包</p>
                <div class="select fl myselect myselect1">
                    <p class="select-option" id="selecto1" data-select='1' ></p>
                    <div class="select-selectbtn"></div>
                    <ul class="select-ul hbList" id="sul1">
                        
                    </ul>
                </div>
            </li>
             <li class="suretz2  clearfix suretz2_1">
                <p class="suretz01 fl pat6">红包收益：</p>
                <p class="suretz03 fl"><em class="hbsy">0</em><span>元</span></p>
            </li>
            <li class="suretz2  clearfix">
                <p class="suretz01 fl pat6">预计总收益：</p>
                <p class="suretz03 fl"><em class="yqsy">0</em><span>元</span></p>
                <div class="insertwz fl">
                    <img src="${cdnServer}/static/weipaidai/images/investxq04.png" class="insertwenh" id="insertwenh" title="预期总收益=投资收益+红包收益">
                </div>
                
            </li>
            <div class="dashed"></div>
            <li class="suretz clearfix">
                <p class="tradepasswordp fl">交易密码：</p>
                <input  class="kitingbankinx1 fl" type="password" placeholder="请输入交易密码" id="Bycombination" datatype="n6-6" sucmsg="&nbsp;" errormsg="交易密码为6位数字,不能有空格" nullmsg="交易密码不能为空" autocomplete="off" onpaste="return false"  placeholder="请输入交易密码">
            </li>
            <button class="quites checked-button" id="zhbBtn">立即购买</button>
            <div class="guanbi mask-close"></div>
        </ul>
    </div>
    <!-- 散标投资详情弹层 -->
    <div class="max1 mask">
        <input type="hidden" class="accwait" value="">
        <ul class="maxtz maxtz1">
            <li class="suretz pat180 clearfix">
                <p class="suretz01 fl">产品名称：</p>
                <p class="suretz02 fl" id="loanname"></p>
            </li>
            <li class="suretz2 clearfix detailListbox">
                <p class="suretz01 fl pat6">预期利率：</p>
                <p class="suretz03 fl"><em class="detailListboxlist">${detailList.labor_year}</em><span>%</span></p>
            </li>
            <li class="suretz2 clearfix">
                <p class="suretz01 fl">投资期限：</p>
                <c:if test="${detailList.interest_type == 1}">
                    <p class="suretz02 fl">${detailList.borrow_days}<span class="qian">天</span></p>
                </c:if>
                <c:if test="${detailList.interest_type == 2}">
                    <p class="suretz02 fl">${detailList.borrow_period}<span class="qian">个月</span></p>
                </c:if>
                <c:if test="${detailList.interest_type == 3}">
                    <p class="suretz02 fl">${detailList.borrow_years}<span class="qian">年</span></p>
                </c:if>
            </li>
            <li class="suretz2 clearfix suretz20">
                <p class="suretz01 fl">投资金额：</p>
                <p class="suretz02 fl">
                    <span class="placehoder-tit ys1">请投满此标或整百投资</span>
                    <input id="investInput" type="text" class="tzmoney" nullmsg="请输入有效金额" errormsg="请投满此标或整百投资" datatype="isNumberto100" sucmsg=" " placeholder="请投满此标或整百投资">
                    <span class="qian2">元</span>
                    <img src="${cdnServer}/static/weipaidai/images/investxq04.png" class="insertwenh" id="jztztip" title="超过剩余可投金额，数值自动变为剩余可投金额">
                    <span class="Validform_checktip errormsg"></span>
                </p>
            </li>
            <div class="dashed"></div>
            <li class="suretz clearfix">
                <p class="suretz01 fl">到期日期：</p>
                <p class="suretz02 fl">${detailList.payment_date}</p>
            </li>
           
            <li class="suretz clearfix">
                <p class="suretz01 fl">使用红包：</p>
                <p class="suretz04 fl" id="znone">暂无可用红包</p>
                <div class="select fl myselect">
                    <p class="select-option" id="selecto" data-select='2'></p>
                    <div class="select-selectbtn"></div>
                    <ul class="select-ul hbList" id="sul">
                      
                    </ul>
                </div>
            </li>
            <li class="suretz2  clearfix suretz2_1">
                <p class="suretz01 fl pat6">红包收益：</p>
                <p class="suretz03 fl"><em class="hbsy">0</em><span>元</span></p>
            </li>
            <li class="suretz2 clearfix">
                <p class="suretz01 fl pat6">预计总收益：</p>
                <p class="suretz03 fl"><em id="amountdue">0</em><span>元</span></p>
                <div class="insertwz fl">
                    <img src="${cdnServer}/static/weipaidai/images/investxq04.png" class="insertwenh" id="insertwenh" title="预期总收益=投资收益+红包收益">
                </div>
            </li>
            <div class="dashed"></div>
             <li class="suretz clearfix">
                <p class="suretz01 fl">交易密码：</p>
                <input  class="phone-input fl" type="password"  placeholder="请输入交易密码" id="accurate" datatype="n6-6" sucmsg="&nbsp;" errormsg="交易密码为6位数字,不能有空格" nullmsg="交易密码不能为空" autocomplete="off" onpaste="return false"  placeholder="请输入交易密码">
                <span class="Validform_checktip errormsg"></span>
            </li>
            <button class="quites checked-button" id='sbshop' data-id="">立即购买</button>
            <div class="guanbi mask-close"></div>
        </ul>
    </div>
    <!-- 散标用户投资详情弹层 -->
    <div class="max2 mask">
        <ul class="maxyh">

        </ul>
    </div>
</c:if>
<!-- 小圆圈 -->
<div class="ui-goTop"></div>
<%@ include file="../common/footer.jsp"%>
