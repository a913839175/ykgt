{{#each lists}}
<tr class="table-td">
    <td class="consignee">{{consignee}}</td>
    <td> {{province}} {{city}} {{area}} </td>
    <td>{{detailed_address}}</td>
    <td>{{#if postal_code}}{{postal_code}}{{else}}暂无{{/if}}</td>
    <td>{{con_phone}}</td>
    <td>
        <a href="javascript:void(0);" data-id="{{id}}" id="J_updataAddr">修改</a> |
        <a href="javascript:void(0);" data-id="{{id}}" id="J_delAddress">删除</a>
    </td>
    {{#equal address_status "1"}} 
    <td><span class="note">默认地址</span></td>
    {{else}}
    <td><a class="implicit hide" href="javascript:void(0);" data-id="{{id}}" id="J_setdefault">设为默认</a></td>
    {{/equal}} 
</tr>
{{/each}}