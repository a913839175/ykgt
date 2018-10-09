{{#each lists}}
<li class="borrsp-li">
	<p class="borrsp-lims1">{{name}}</p>
	<div class="cpms clearfix">
		<img src="/static/weipaidai/images/borrowd{{@index}}.jpg" class="cpmsimg1 fl">
		<div class="cpmswz1 fl clearfix">
			<p class="cpmswz2">{{name}}</p>
			<div class="cpmswz3">{{{borrow_describe}}}</div>
		</div>
		<a class="applyfor fl">立即申请</a>
	</div>
</li>
{{/each}}