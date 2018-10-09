{{#if lists}}
{{#each lists}}
<li class="list-items clearfix">
    {{#bigthan shut_id "0"}}
        <a href="/invest/detail/shut/{{shut_id}}">
        <div class="list-left" loan_nid = {{loan_nid}} shut_id = {{shut_id}}>
            <div class="list-left-top">
                <p class="list-title fl">{{loan_name}}</p>
                <p class="list-count fl">{{loan_apr_year}}<em>%</em></p>
            </div>
            <div class="lit-left-bottom">
                <p class="list-time fl">购买时间：{{loan_date}}</p>
                <p class="list-profit fl">历史年化收益</p>
            </div>
        </div></a>
    {{else}}
        <a href="/invest/detail/loan/{{loan_nid}}">
        <div class="list-left" loan_nid = {{loan_nid}} shut_id = {{shut_id}}>
            <div class="list-left-top">
                <p class="list-title fl">{{loan_name}}</p>
                <p class="list-count fl">{{loan_apr_year}}<em>%</em></p>
            </div>
            <div class="lit-left-bottom">
                <p class="list-time fl">购买时间：{{loan_date}}</p>
                <p class="list-profit fl">历史年化收益</p>
            </div>
        </div></a>
    {{/bigthan}}
    <div class="list-right clearfix">
        {{#equal status "3"}}
            <div class="list-right-l fl">
                <p class="list-desc">投资金额：{{account}}元</p>
                <p class="list-desc">还款方式：{{repayment_methods}}</p>
                <p class="list-desc">使用红包：{{#equal use_hongbao_desc ""}}无{{else}}{{use_hongbao_desc}}{{/equal}}</p>
                <p class="list-desc">当前状态：<em class="green">{{status_desc}}</em></p>
            </div>
        {{else}}
            <div class="list-right-l fl">
                <p class="list-desc">投资金额：{{account}}元</p>
                <p class="list-desc">待收期数：{{await_times}}期</p>
                <p class="list-desc">当前状态：<em class="green">{{status_desc}}</em></p>
                <p class="list-desc">使用红包：{{#equal use_hongbao_desc ""}}无{{else}}{{use_hongbao_desc}}{{/equal}}</p>
            </div>
            <div class="list-right-r fl">
                <p class="list-desc">预期收益：<em class="green">{{recover_account_interest}}元</em></p>
                <p class="list-desc">回款日期：{{payment_date}}</p>
                <p class="list-desc">还款方式：{{repayment_methods}}</p>
                <p class="list-desc">操作：<a href="javascript:void(0);" class="datil red" data-id="{{p_id}}">明细</a></p>
            </div>      
        {{/equal}}
    </div>
</li>
{{/each}}
{{else}}
<div class="trade_null {{lists.length}}" >
    <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
</div>
{{/if}}