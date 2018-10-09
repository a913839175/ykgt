define(function(require, exports, module){
	var Validform = require('Validform');
	var MD5 = require('MD5');
	var JSEncrypt = require('JSEncrypt');
	var kiting = {
		//Js 正则表达式 正整数或一位小数或者俩位小数的正则表达式
		reg : /^[0-9]+([.]{1}[0-9]{1,2})?$/,
		init:function(){
			this.RefreshData();
			this.bindEvent();
		},
		randerHtml:function(){},
		RefreshData:function(){
			//获取用户提现的相关信息
			G.post(Service.get_cash_refresh_data,{},function(data){
				// console.log(data)
				$('.recharge_account').html(data.balance).data("balance",data.balance);
				if(data.bank_url){
					$(".bdbankimg1").attr("src", '/static/weipaidai/images/bank/'+ data.bank_url);
				}else{
					$(".bdbankimg1").hide();
				}		
				$('.bdbankp2').html(data.bank_name);
				$('.rechargewh').html(data.card_no_end.substr(data.card_no_end.length-4));
			});
		},
		//提现
		kitingFn:function(){
			var parmas = {
				frontRetUrl:DomainURL+'/user/account?type=account',
				transAmt:$('.kitingbankin1').val(),
				pay_pwd:$.md5($('.kitingbankinx1').val())
			};
			G.showLoading();
			G.post(Service.bscg_user_cash,parmas,function(data){
				G.hideLoading();
				if(data.returnCode == 1){
					G.$alert("您的提现已申请成功",true,function(){
						window.location.href = '/user/account'; 
					});						
				}else if(data.returnCode=='-5'){
					$(".mask").remove();
	                G.$alert("登录超时或已在别处登录,请重新登录",false,function(){
	                    G.Logout(); 
	                },true);
				}else{
					G.$alert(data.returnMsg,false);
					$('#kitingsure').removeClass("btn-disable").removeAttr("disabled");
				}
			},function(data){
				$('#kitingsure').removeClass("btn-disable").removeAttr("disabled");
			});
		},
		bindEvent:function(){
			var _this = this
			//提现金额验证
			$(".recharge-box").Validform({
				btnSubmit:"#kitingsure",
				tiptype: 3,
				datatype:{
					isNumberthan100:function(gets,obj,curform,regxp){
						if(_this.reg.test(gets)){
							var accwait = parseFloat($('.recharge_account').data("balance"));
				 			if(gets < 100) {
							  	return false;
							}else if(gets > accwait){
			                    return '账户余额不足';                 
			                }else {
							  	return true;
							}
						}else{
					  		return "请输入正确的金额";
					  	}
					},
					agree:function(gets,obj,curform,regxp){
						if(!curform.find("input[name='"+obj.attr("name")+"']:checked").length){
							return false;
						}						
					},
				},
				beforeSubmit:function(curform){			
					_this.kitingFn();
					$('#kitingsure').addClass("btn-disable").attr('disabled',true);
				}
			});
		}
	}
	return kiting.init();
});

