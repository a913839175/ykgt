{{#if lists}}
{{#each lists}}
<tr>
    <td>{{name}}</td>
    <td>{{account}}</td>
    <td>{{timestamp}}</td>  
    <td>{{#equal status "1"}}成功{{else}}失败{{/equal}}</td>
</tr>
{{/each}}
{{else}}
<tr class="dark">
    <td  colspan="4" class="trade_null" style="text-align: center;padding: 40px 0;">
        <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
    </td>
</tr>
{{/if}}