{{#if lists}}
{{#each lists}}
<li class="news-list">
    <a href="/news/detail/{{id}}">{{title}}<span>{{addtime}}</span></a>
</li>
{{/each}}
{{else}}
<div class="trade_null" style="text-align: center;padding: 20px 0;">
    <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
</div>
{{/if}}