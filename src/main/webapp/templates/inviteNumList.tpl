{{#if lists}}
{{#each lists}}
<div class="pop-td-list clearfix">
	<p class="pop-table-th w1">{{loan_nid}}</p>
	<p class="pop-table-th w2">{{investor}}</p>
	<p class="pop-table-th w3">{{use_type}}</p>
</div>
{{/each}}
{{else}}
<div class="trade_null {{lists.length}}" style="border-bottom: 1px solid #dcdcdc;">
    <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
</div>
{{/if}}