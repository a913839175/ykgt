{{#each lists}}
<li class="investcpli clearfix" data-shutid="{{shut_id}}" data-loanid="{{loan_nid}}">
	<div class="invest-income fl">
		<p class="invest-ins1">
		{{#equal borrow_type "sds"}}
		{{loan_name}}
		{{else}}
		{{shut_name}}
		{{/equal}}
		</p>
		<p class="invest-ins2">{{labor_year}}{{#equal other_labor_year "0.00"}}<span>%</span>{{else}}<span>%</span><em>+</em>{{other_labor_year}}<span>%</span>{{/equal}}
		</p>
		<p class="invest-ins3">预期利率</p>
	</div>
	<div class="invest-income2 fl">
		{{#equal interest_type 1}}
            <p class="invest-ins4">{{borrow_days}}<span>天</span></p>
        {{/equal}}
        {{#equal interest_type 2}}
            <p class="invest-ins4">{{borrow_period}}<span>个月</span></p>
        {{/equal}}
        {{#equal interest_type 3}}
            <p class="invest-ins4">{{borrow_years}}<span>年</span></p>
        {{/equal}}
		<p class="invest-ins5">项目期限</p>
	</div>
	<div class="invest-income_3 fl">{{repayment_methods}}</div>
	<div class="invest-income3 fl">
		<div class="invest-jd clearfix" >
			<div class="progress-bar fl">
				<p class="schedule-bg progress " data-width="{{schedule}}%"></p>	
			</div>
			<p class="schedule-wz1 fl">{{schedule}}%</p>
		</div>
		<p class="invest-ins6">项目进度</p>
	</div>
	<div class="invest-income4 fl">
		{{#equal borrow_type "sds"}}
			{{#equal schedule "100.00"}}
		    	<a class="ysq" href="javascript:void(0);">已满标</a>
		    {{else}} 
		    	<a class="invest-gm" href="/invest/detail/loan/{{loan_nid}}" target="_blank">立即购买</a>
		    {{/equal}}
		{{else}}
			{{#equal schedule "100.00"}}
		    	<a class="ysq" href="javascript:void(0);">已满标</a>
		    {{else}} 
		    	<a class="invest-gm" href="/invest/detail/shut/{{shut_id}}" target="_blank">立即购买</a>
		    {{/equal}}		
		{{/equal}}
		<p class="invest-ins7">可投：{{account}}元</p>
	</div>
</li>
{{/each}}