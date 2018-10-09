{{#if lists}}
{{#each lists}}
<ul class="record-ul clearfix">
	<li class="sp1 fl">
		<p class="record-p1">{{stime1}}<br />{{stime2}}</p>
	</li>
	<li class="sp2 fl tcenter">{{stype}}</li>
	<li class="sp3 fl sname tcenter">{{sname}}</li>
	<li class="sp4 fl balance">{{fund_change}}</li>
	<li class="sp5 fl balance tcenter">{{balance}}</li>
	<li class="sp6 fl danhao" title="{{batch}}">{{batch}}</li>
</ul>
{{/each}}
{{else}}
<div class="trade_null" >
    <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
</div>
{{/if}}