{{#if lists}}
	{{#equal status "0"}}
		{{#each lists}}
			{{#equal stype "现金红包"}}
			<li class="xhblist clearfix fl">
					<div class="xhblistleft fl clearfix">
						<a href="javascript:void(0)" data-id="{{id}}" class="suress">
						<div class="xhblistleft01">
							<div class="xjhb fl ">
								<img src="/static/weipaidai/images/hongbao01.png" class="hb_liimg1">
								<p class="sures">点击使用</p>
							</div>
							<p class="hb_lipxj fr">{{title}}</p>
						</div></a>
						<div class="xhblistleft02 mart119">
							<div class="xhblistleft03 clearfix mat5b15">
								<p class="xhblistleft04 fl">使用期限: </p>
								<p class="xhblistleft05 fl">{{use_period_desc}}</p>
							</div>
						</div>
					</div>
					<div class="xhblistright fl">
						<p class="xhblistright01">现金红包</p>
					</div>
				</li>
			{{else}}
			<li class="xhblist clearfix fl">
					<div class="xhblistleft fl clearfix">
						<div class="xhblistleft06">
							{{#equal stype "加息红包"}}
								<img src="/static/weipaidai/images/hongbao02.png" class="hb_liimg1 fl">
							{{else}}
								<img src="/static/weipaidai/images/hongbao03.png" class="hb_liimg1 fl">
							{{/equal}}
						<p class="hb_lip1 fr">{{title}}</p>
						</div>
						<div class="xhblistleft07">
							<div class="xhblistleft03 clearfix mat11">
								<p class="xhblistleft04 fl">适用产品: </p>
								<p class="xhblistleftx fl">{{name}}</p>
							</div>
							<div class="xhblistleft03 clearfix mat6">
								<p class="xhblistleft04 fl">使用条件: </p>
								{{#equal stype "加息红包"}}
									<p class="xhblistleftx2 fl" title="单笔投资满{{use_condition}}元，最高不超过{{use_condition_max}}元">单笔投资满{{use_condition}}元，最高不超过{{use_condition_max}}元</p>
								{{else}}
									<p class="xhblistleftx2 fl" title="单笔投资满{{use_condition}}元使用">单笔投资满{{use_condition}}元使用</p>
								{{/equal}}
								
							</div>
							<div class="xhblistleft03 clearfix mat5b15 ">
								<p class="xhblistleft04 fl">使用期限: </p>
								<p class="xhblistleft05 fl">{{use_period_desc}}</p>
							</div>
						</div>
					</div>
					<div class="xhblistright fl">
						<p class="xhblistright01">{{stype}}</p>
					</div>
				</li>
			{{/equal}}
		{{/each}}
	{{else}}
		{{#each lists}}
			{{#equal stype "现金红包"}}
				<li class="xhblist clearfix fl">
					<div class="xhblistleft fl clearfix">
						<div class="xhblistleft01">
							<div class="xjhb fl ">
								<img src="/static/weipaidai/images/hongbao04.png" class="hb_liimg1">
								<p class="sures1">点击使用</p>
							</div>
							<p class="hb_lipxj_1 fr">{{title}}</p>
						</div>
						<div class="xhblistleft02 mart119">
							<div class="xhblistleft03 clearfix mat5b15">
								<p class="xhblistleft04 fl">使用期限: </p>
								<p class="xhblistleft05 fl">{{use_period_desc}}</p>
							</div>
						</div>
					</div>
					<div class="xhblistright fl">
						<p class="xhblistright011">现金红包</p>
					</div>
				</li>
			{{else}}
			<li class="xhblist clearfix fl">
				<div class="xhblistleft fl clearfix">
					<div class="xhblistleft06">
						{{#equal stype "加息红包"}}
							<img src="/static/weipaidai/images/hongbao05.png" class="hb_liimg1 fl">	
						{{else}}
							<img src="/static/weipaidai/images/hongbao06.png" class="hb_liimg1 fl">
						{{/equal}}
					<p class="hb_lip_1 fr">{{title}}</p>
					</div>
					<div class="xhblistleft07">
						<div class="xhblistleft03 clearfix mat11">
							<p class="xhblistleft04 fl">适用产品: </p>
							<p class="xhblistleftx fl">{{name}}</p>
						</div>
						<div class="xhblistleft03 clearfix mat6">
							<p class="xhblistleft04 fl">使用条件: </p>
							{{#equal stype "加息红包"}}
								<p class="xhblistleftx2 fl" title="单笔投资满{{use_condition}}元，最高不超过{{use_condition_max}}元">单笔投资满{{use_condition}}元，最高不超过{{use_condition_max}}元</p>
							{{else}}
								<p class="xhblistleftx2 fl" title="单笔投资满{{use_condition}}元使用">单笔投资满{{use_condition}}元使用</p>
							{{/equal}}
						</div>
						<div class="xhblistleft03 clearfix mat5b15 ">
							<p class="xhblistleft04 fl">使用期限: </p>
							<p class="xhblistleft05 fl">{{use_period_desc}}</p>
						</div>
					</div>
				</div>
				<div class="xhblistright fl">
					<p class="xhblistright011">{{stype}}</p>
				</div>
			</li>
			{{/equal}}
		{{/each}}
	{{/equal}}
{{else}}
	<div class="trade_null {{lists.length}}" >
	    <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
	</div>
{{/if}}