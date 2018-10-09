{{#if lists}}
{{#each lists}}
<ul class="record-ul clearfix">
    <li class="w25 fl">{{loan_nid}}</li>
    <li class="w15 fl ">{{repay_time}}</li>
    <li class="w15 fl">共 {{total_period}} 期</li>
    <li class="w15 fl">第 {{repay_period}} 期</li>
    <li class="w15 fl balance">{{repay_account}}</li>
    <li class="w15 fl">{{repay_status}}</li>
</ul>
{{/each}}
{{else}}
<div class="trade_null" >
    <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
</div>
{{/if}}