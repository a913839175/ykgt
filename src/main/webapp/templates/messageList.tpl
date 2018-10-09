{{#if lists}}
<div class="message-header">
	<span class="readmsg">全部已读</span>
	<!-- <span class="unreadmsg"><em class="message-icon"></em>未读2 </span> -->
</div>

<div class="message-table">
	<div class="message-thead">
		<div class="td td1">类型</div>
		<div class="td td2">消息内容</div>
		<div class="td td3">时间</div>
	</div>
	<div class="message-tbody">
		{{#each lists}}
		{{log message_id}}
		<div class="td-list" data-id="{{message_id}}" data-status="{{is_read}}"> 
			<div class="td td1"><em class="message
			{{#equal is_read "未读"}}
			message-icon
			{{else}}
			message-icon1
			{{/equal}}
			"></em>{{stype}}</div>
			<div class="td td2 tooltips" data-title="{{context}}"><span>{{context}}</span></div>
			<div class="td td3">{{create_time}}</div>
		</div>
		{{/each}}					
	</div>
</div>

{{else}}
<div class="trade_null {{lists.length}}" >
    <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
</div>
{{/if}}
			