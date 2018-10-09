{{#if lists}}
{{#each lists}}
<li class="record-list">
    <h2 class="record-list-time">兑换时间：{{prettifyDate time "yyyy-MM-dd"}}</h2>
    <div class="record-list-warp">
        <div class="record-list-img">
            <img data-src="{{order_img}}">
        </div>
        <div class="record-list-item">
            <p class="record-list-title">{{name}}</p>
        </div>
        <p class="record-list-p record-list-num">{{num}}</p>
        <p class="record-list-p record-list-wb">{{detail}}</p>
        <p class="record-list-p record-list-status">{{status}}</p>
        <p class="record-list-p"><a class="record-list-link" href="/mall/orderdetail/{{order_id}}" target="_blank" >查看详情</a></p>
    </div>                      
</li>
{{/each}}
{{else}}
<div class="trade_null {{lists.length}}" style="text-align: center;padding: 40px 0;">
    <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
</div>
{{/if}}