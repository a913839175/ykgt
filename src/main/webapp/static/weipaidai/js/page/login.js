define(function(require, exports, module){
	var drag = require('drag');
	var MD5 = require('MD5');
	var JSEncrypt = require('JSEncrypt');
	var EnPlaceholder = require("EnPlaceholder");
	var Validform = require('Validform');
	var oauthUrl = G.getUrlparam("redirectURL") || "";
    function locationHref(type){
    	console.log(oauthUrl)
		if(oauthUrl){
			window.location = oauthUrl;			
		}else{
			if(type == '02'){
				window.location = "/user/account";
			}else{
				window.location = "/index";
			}
		}
    }
  	var isClick = false;
  	var encodeStr = function(STR,TOKEN){
	    return JSEncrypt(STR,PAGENAME,TOKEN,PAGEWEB);
	};

	$(".dlselect-btn").on('click',function(){
		$(this).addClass("active").siblings().removeClass("active");
	});
	
	$("#drag").drag({
		callback: function(result) { 
			isClick = true;
		}
	});	
	$('.dlright').Validform({
		btnSubmit:"#dlsure",
		tiptype: function(msg,o,cssctl){
			if(msg && msg.length>1){
				$(".dlerror").html(msg);
				return false;
			}else{
				$(".dlerror").html("");
			}		
		},
		beforeSubmit:function(curform){
			isClick ? loginFun() : $('.ui-slider-btn').addClass('active');
			setTimeout(function(){
				$('.ui-slider-btn').removeClass('active');
			},500);			
		}
	});
	//身份验证码
	var loginFun = function (){
		var password = $.md5($('.dlpasswordinput').val());
		var username = $('.dlphoneinput').val();
		var loginType = $(".dlselect-btn.active").attr("data-value");
		var params = JSON.stringify({u1: username,u2: password,u3:loginType});
		var subtime = new Date().getTime()+"";
		$('#dlsure').attr("disabled","true");
	    G.post('/api/login',{
	    	CSRFTOKEN:encodeStr(params,subtime),
	    	subtime:subtime
	    },function(data){
	    	if(!data){
	    		G.toast("接口繁忙，请稍候再试~");
	    		$('#dlsure').removeAttr("disabled");
				return false;
	    	}		
			if(data.result == "1"){
				locationHref(data.login_type);
			}else if(data.last_country == "国外"){
				G.$alert("近期有异地登录,为了你的安全请修改密码",false,function(){
					locationHref(data.login_type);
				},true);
				$('#dlsure').removeAttr("disabled");
			}else{
				G.$alert(data.errorMsgInfo,false);
				$('#dlsure').removeAttr("disabled");
			}
		},function(data){
			G.toast("接口繁忙，请稍候再试~");
			$('#dlsure').removeAttr("disabled");
		});
	};
	$(document).keypress(function(e) {
        var eCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        if (eCode == 13){
            $("#dlsure").trigger('click');
        }
	});
});