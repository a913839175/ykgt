{{#if lists}}
{{#each lists}}
<li class="cert-list" data-id="{{id}}">
    <a href="{{thumb}}" target="_blank">
        <p class="list-pic">
            <img src="{{thumb}}" width="280" height="220">
        </p>   
        <p class="list-title">{{title}}</p>
    </a>
</li>
{{/each}}
{{else}}
<div class="trade_null">
    <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
</div>
{{/if}}