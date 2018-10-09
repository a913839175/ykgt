{{#if lists}}
{{#each lists}}
<tr class="dark">
    <td><div class="ui-td-bg pl60">{{page}}</div></td>
    <td><div class="ui-td-bg pl25">{{tender_user_name}}</div></td>
    <td class="text-right"><div class="ui-td-bg pr70"><em>{{account}}</em>元</div></td>
    <td class="text-right"><div class="ui-td-bg pr70"><em>{{tender_time}}</em></div></td>
</tr>
{{/each}}
{{else}}
<tr class="dark">
    <td  colspan="4" class="trade_null" style="text-align: center;padding: 40px 0;">
        <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
    </td>
</tr>
{{/if}}