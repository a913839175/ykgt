define(function(require, exports, module){
	var Validform = require('Validform');
	var $formButton = $('#formButton');
	var borrowForm = $('.borrow-form').Validform({
		btnSubmit: "#formButton",
		tiptype: function(msg,o,cssctl){
			if(msg && msg.length>1){
				G.toast(msg)
				return false;
			}else{
			}		
		},
		beforeSubmit: function(curform) {
			loanApply();
			$formButton.addClass("btn-disable").attr('disabled',true);
		}
	});
	var loanApply = function(){
		var parmas = {
			account:$('#account').val(),
			loan_type:$('#loan_type').val(),
			loan_use_desc:$('#loan_use_desc').val(),
			phone:$('#phone').val(),
		};
		G.showLoading();
		G.post(Service.loanApply,parmas,function(data){
			G.hideLoading();
			if(data.returnCode == 1){
				G.$alert("您的借款申请已提交",true,function(){
					window.location.href = '/user/account'; 
				});						
			}else{
				G.$alert(data.returnMsg,false);
				$formButton.removeClass("btn-disable").removeAttr("disabled");
			}
		},function(data){
			$formButton.removeClass("btn-disable").removeAttr("disabled");
		});
	}		
});
