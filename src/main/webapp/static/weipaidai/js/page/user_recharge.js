define(function(require, exports, module){
	var Validform = require('Validform');
	var MD5 = require('MD5');
	G.post(Service.get_cash_refresh_data,{},function(data){
		if(data.bank_url){
			$(".bdbankimg1").attr("src",'/static/weipaidai/images/bank/'+ data.bank_url);
		}else{
			$(".bdbankimg1").hide();
		}
		$('.dbxe').html(data.limit_single).data("limit_single",data.limit_single);
		$('.drxe').html(data.limit_day).data("limit_day",data.limit_day);
		if(data.surplus_day <= 0){
			$('.syxe').html('0');
		}else{
			$('.syxe').html(data.surplus_day);
		}		
		$('.bdbankp2').html(data.bank_name);
		$('.rechargewh').html(data.card_no_end.substr(data.card_no_end.length-4));
	});
	$('.recharge-tab-list').on('click',function(){
		var index = $(this).index();
		$(this).addClass('active').siblings().removeClass('active');
		$('.form-bank').eq(index).show().siblings('.form-bank').hide();
		$('.pay_type').val(index);
		if(index==1){
			$('.pwd-input').removeAttr("ignore");
		}else{
			$('.pwd-input').attr("ignore","ignore");
		}
	});
	$('.recharge-bank-list').on('click',function(){
		$(this).find('input').attr('checked',true);
	});
	//Js 正则表达式 正整数或一位小数或者俩位小数的正则表达式
	var reg =/^[0-9]+([.]{1}[0-9]{1,2})?$/;
	$('.recharge-input').bind('input propertychange', function() {
		var gets = $(this).val();
		var limit_single = parseFloat($('.dbxe').data("limit_single"));
		var limit_day = parseFloat($('.drxe').data("limit_day"));
		if(reg.test(gets)){
			if(gets >= 100 && gets < limit_single && gets < limit_day) {
				$('.recharge-button').removeClass('btn-disable').addClass('active').attr('disabled',false);
			}else {
			  	$('.recharge-button').addClass('btn-disable').removeClass('active').attr('disabled',true);
			}
		}
	});
	$(".recharge-form").Validform({
		btnSubmit:"#sureBtn",
		tiptype: 3,
		datatype:{
			isNumberthan100:function(gets,obj,curform,regxp){
				var limit_single = parseFloat($('.dbxe').data("limit_single"));
				var limit_day = parseFloat($('.drxe').data("limit_day"));
				if(reg.test(gets)){
					if(gets < 100) {						
						return false;
					}else if(gets > limit_single){
	                    return '充值金额超出单笔限额';                 
	                }else if(gets > limit_day){
	                    return '充值金额超出单日限额';                 
	                }else {
	                	$('.recharge-button').removeClass('btn-disable').addClass('active').attr('disabled',false);
					  	return true;
					}
			  	}else{
			  		return "请输入正确的金额";
			  	}
			}
		},
		beforeSubmit:function(curform){
			var pwd = $.md5($('.pwd-input').val()); 
			$('.recharge-button').addClass('btn-disable').removeClass('active').attr('disabled',true);
			$('.frontRetUrl').val(DomainURL+'/user/account');
			$('#pwd_md5').val(pwd);					
		}
	});
});