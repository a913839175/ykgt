{{#if lists}}
{{#each lists}}
<li class="list-items clearfix">
	<div class="list-left">
		<div class="list-left-top">
			<p class="list-title fl">{{borrow_nid_name}}</p>
			<p class="list-count fl">{{loan_apr_year}}<em>%</em></p>
		</div>
		<div class="lit-left-bottom">
			<p class="list-time fl">起息时间：{{loan_date}}</p>
			<p class="list-profit fl">预期利率</p>
		</div>
	</div>
	<div class="list-right clearfix">
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
			<p class="list-desc">合同：<a href="{{contract_name}}" class="red" target="_blank">查看</a></p>			
		</div>
	</div>
</li>
{{/each}}
{{else}}
<div class="trade_null {{lists.length}}" >
    <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
</div>
{{/if}}