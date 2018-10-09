{{#if lists}}
{{#each lists}}
<li class="AccurateList_li clearfix">
    <input type="hidden" class="loan_nid" value="{{loan_nid}}">
    <div class="Anumber fl">
        <p class="Anumber01">{{loan_name}}</p>
        <p class="Anumber02">标题</p>
    </div>
    <button class="Axq fl">详情</button>
    <div class="Atype fl">
        <p class="Atype01">{{borrow_use}}</p>
        <p class="Atype02">用途</p>
    </div>
    <div class="invest-income3 fl">
        <div class="invest-jd clearfix">
            <div class="progress-bar fl">
                <p class="schedule-bg progress " data-width="{{schedule}}%" style="width: {{schedule}}%;"></p>	
            </div>
            <p class="schedule-wz1 fl">{{schedule}}%</p>
        </div>
        <p class="invest-ins6">项目进度</p>
    </div>
    <div class="AMoney fl">
        <p class="AMoney01">{{borrow_account_wait}}<span>元</span></p>
        <p class="AMoney02">可投金额</p>
    </div>
    {{#equal schedule "100.00"}}
    <button class="ysq fr" data-id="{{loan_nid}}">已满标</button>
    {{else}} 
    <button class="ljsure fr" data-id="{{loan_nid}}" data-value="{{borrow_account_wait}}">立即购买</button>
    {{/equal}}
</li>
{{/each}}
{{else}}
<div class="trade_null" style="padding: 100px 0;text-align: center;">
    <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
</div>
{{/if}}