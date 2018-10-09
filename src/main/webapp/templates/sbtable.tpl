<div class="yhhead">
     <p class="yhhead01">用户信息</p>
</div>
<div class="yhcenter">
   <div class="yhhead02">
       <ul class="yhul1 clearfix">
           <li>姓名：<span class="hytzxq01">{{#equal user_name ""}}
           --
           {{else}}
           {{user_name}}
           {{/equal}}</span></li>
           <li>性别：<span class="hytzxq02">{{#equal sex ""}}
           --
           {{else}}
           {{sex}}
           {{/equal}}</span></li>
           <li>年龄：<span class="hytzxq03">{{#equal age ""}}
           --
           {{else}}
           {{age}}
           {{/equal}}</span></li>
           <li>所在地：<span class="hytzxq03">{{#equal native_place ""}}
           --
           {{else}}
           {{native_place}}
           {{/equal}}</span></li>
       </ul>
       <ul class="yhul12 clearfix">
           <li>证件号码：<span class="hytzxq05">{{#equal id_no ""}}
           --
           {{else}}
           {{id_no}}
           {{/equal}}</span></li>
           <li>手机号：<span class="hytzxq06">{{#equal mobile_phone ""}}
           --
           {{else}}
           {{mobile_phone}}
           {{/equal}}</span></li>
           <li>借款用途：<span class="hytzxq07">{{#equal borrow_use ""}}
           --
           {{else}}
           {{borrow_use}}
           {{/equal}}</span></li>
           <li>税后收入：<span class="hytzxq07">
           {{#equal income_at ""}}
           --
           {{else}}
           {{income_at}}
           {{/equal}}</span></li>
       </ul>
         <ul class="yhul12 clearfix">
           <li>职务名称：<span class="hytzxq05">
           {{#equal duty_name ""}}
           --
           {{else}}
           {{duty_name}}
           {{/equal}}</span></li>
       </ul>
   </div>
   <p class="yhhead03">借款描述</p>
   <p class="yhhead04">{{borrow_desc}}</p>
   <p class="yhhead05">资料审核</p>
   <table id="sbtable">
        <thead>
            <tr>
                <th>资料类型</th>
                <th>上传数量</th>
                <th>状态</th>
            </tr>
        </thead>
        <tbody id="sbtbody">
            {{#each lists}}
            <tr>
                <td>{{stype}}</td>
                <td>{{account}}</td>
                <td>{{status}}</td>
            </tr>
            {{/each}}
        </tbody>
   </table>
</div>
<div class="guanbi mask-close"></div>
