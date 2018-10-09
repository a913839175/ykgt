{{#each lists}}
<li class="addressz-li {{#equal @index 0}}on{{/equal}}" data-id="{{id}}">
     <div class="address-weizhi">
         <img src="/static/weipaidai/images/mall/sureorder01.png" class="addressz-img">
         <p class="addressz-ms01">寄送至</p>
     </div>
     <input name="address" type="radio" class="addressz-radio" {{#equal @index 0}}checked="checked"{{/equal}} />
     <p class="addressz-ms03"><span class="J_address">{{replace_address}} {{detailed_address}}</span> （{{consignee}} 收） {{con_phone}}  
    {{#equal address_status "1"}} 
        <strong class="addr-default">默认地址</strong>
    {{else}}
        <a class="set-default" data-id="{{id}}">设置为默认收货地址</a>
    {{/equal}} 
     </p>
     <button class="addressz-change J_upaddr" data-id="{{id}}">修改本地址</button>
</li>
{{/each}}
