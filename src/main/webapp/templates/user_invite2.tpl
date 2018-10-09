{{#if lists}}
{{#each lists}}
	<tr>
		<td width="33%">{{mobile}}</td>
		<td width="33%">{{user_name2}}</td>
		<td width="33%">{{loan_date}}</td>
	</tr>	
{{/each}}
{{else}}
<tr style="height:291px;">
    <td colspan="3" class="trade_null" style="text-align: center;padding: 20px 0;">
        <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
    </td>
</tr>
{{/if}}
