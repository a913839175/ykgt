{{#if lists}}
{{#each lists}}
<div class="pop-td-list clearfix">
	<p class="pop-table-th w1">{{loan_nid}}</p>
	<p class="pop-table-th w2">{{investor}}</p>
	<p class="pop-table-th w3">{{#if contract_name}}<a href="{{contract_name}}" target="_blank">查看</a>{{else}}暂无{{/if}}</p>
	<p class="pop-table-th w4">{{account}}</p>
</div>
{{/each}}
{{else}}
<div class="trade_null {{lists.length}}" style="border-bottom: 1px solid #dcdcdc;">
    <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
</div>
{{/if}}