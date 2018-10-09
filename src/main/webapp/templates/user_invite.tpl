{{#if lists}}
{{#each lists}}
<tr>
	<td width="18%">{{mobile}}</td>
	<td width="10%">{{user_name2}}</td>
	<td width="18%">{{loan_product_name}}</td>
	<td width="18%">{{accout}}</td>
	<td width="18%">{{loan_date}}</td>
	<td width="18%">{{loan_end_date}}</td>
</tr>	
{{/each}}
{{else}}
<tr style="height:291px;">
    <td colspan="6" class="trade_null" style="text-align: center;padding: 20px 0;">
        <img alt="暂无数据" class="pic-nodata" src="/static/weipaidai/images/pic-nodata.png">
    </td>
</tr>
{{/if}}