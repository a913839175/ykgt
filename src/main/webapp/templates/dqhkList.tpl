{{#if lists}}
    {{#if listType}}
        {{#each lists}}
        <tr>
            <td>{{name}}</td>
            <td>{{account}}</td>
            <td>{{timestamp}}</td>  
            <td>{{#equal status "1"}}成功{{else}}失败{{/equal}}</td>
        </tr>
        {{/each}}
    {{else}}
        {{#each lists}}
        <tr>
            <td>{{timestamp}}</td>
            <td>{{account}}</td>
            <td>{{type}}</td>  
            <td>{{status}}</td>
        </tr>
        {{/each}}
    {{/if}}
{{else}}
    <tr class="dark">
        <td  colspan="4" class="trade_null" style="text-align: center;padding: 20px 0;">
            <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
        </td>
    </tr>
{{/if}}
