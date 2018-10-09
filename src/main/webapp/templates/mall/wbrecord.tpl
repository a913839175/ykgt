{{#if lists}}
{{#each lists}}
<tr data-id="{{id}}">
    <td>{{addtime1}}</td>
    <td>{{consume_type}}</td>
    <td>{{credit}}</td>
</tr>

{{/each}}
{{else}}
<tr class="dark">
    <td  colspan="3" class="trade_null" style="text-align: center;padding: 40px 0;">
        <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
    </td>
</tr>
{{/if}}