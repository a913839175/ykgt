define(function(require, exports, module){
	require('page/account_common.js');
	var MD5 = require('MD5');
	var EnPlaceholder = require("EnPlaceholder");
	var Validform = require('Validform');
	var JSEncrypt = require('JSEncrypt');
	var user_id = $('#userid').val();
	var safety = {
		init:function(){
			this.bindEvent();
		},
		encodeStr:function(STR,TOKEN){
			return JSEncrypt(STR,PAGENAME,TOKEN,PAGEWEB);
		},
		JY:function(){
			var _this = this;
			var password1 = $("input[name='Jpassword1']").val();
			var password2 = $("input[name='Jpassword2']").val();
			var password3 = $("input[name='Jpassword3']").val();		
			var reg = /^[0-9]+.?[0-9]*$/; 
			if(!password1){
				G.toast('请您输入旧密码');
				return false;
			}else if(password1.length < 6){
				G.toast('旧密码的位数不能小于6位');
				return false;
			}else if(password1.length < 6){
				G.toast('新密码的位数不能小于6位');
				return false;
			}else if(!password2){
				G.toast('请您输入新密码');
				return false;
			}else if(!password3){
				G.toast('请您输入确认新密码');
				return false;
			}else if(!reg.test(password2)){
				G.toast('新密码必须为6位数字');
				return false;
			}else if(!reg.test(password3)){
				G.toast('确认密码必须为6位数字');
				return false;
			}else if(password3.length < 6){
				G.toast('确认新密码的位数不能小于6位');
				return false;
			}else if(password2 != password3){
				G.toast('两次输入新的密码不一致');
				$("input[name='Jpassword2']").val('');
				$("input[name='Jpassword3']").val('');
				$("input[name='Jpassword2']").focus();
				return false;
			}else{
				var postData = JSON.stringify({
	                'u1': webAppInfo.user_id,
	                'u2': webAppInfo.us_token,
	                'u3': $.md5(password2),
	                'u4': $.md5(password1),
	                'u5': 'B0001',
	                'u6': webAppInfo.user_type
	            });

	            var subtime = new Date().getTime()+"";
	            var params = {
	                userVerify: _this.encodeStr(postData, subtime),
	                unixkey: subtime
	            };
	            G.post(Service.userModifyPayPwd,params,function(data){
	            	console.log(data)
					if(data.returnCode == 1){
						$('.mask').hide();
						G.$alert('密码修改成功', true,function(){
							location.reload();
						});
					}else{
						G.toast(data.returnMsg);
					}		
				}); 
			}
		},
		bindEvent:function(){
			var _this = this
			//绑定银行卡
			$("#B_Bnakcard").on('click',function(){
				G.$alert('请先完成您的实名认证',false,function(){
					window.location = '/user/reg/realname';
				});
			});
			//交易密码弹窗开启
			$('#dealrevamp1').on('click',function(){
				if(G.UserInfo.realname_flag === "1"){
					$('#J-JY').show();
				}else{
					G.$alert('请先完成您的实名认证',false,function(){
						window.location = '/user/reg/realname';
					});
				}
			});
			//实名认证 点击
			$('#realname').on('click',function(){
				if(G.UserInfo.realname_flag !== "1"){
					window.location = '/user/reg/realname';
				}
			});
			//点击修改交易密码
			$(document).on('click','#JY',function(){
				_this.JY();
			});
				//修改登录密码开
			$('#loginrevamp').on('click',function(){
				$('#J-changep').show();
			});
			//登陆密码和交易密码弹窗关闭 和 数据初始化
			$(document).on('click','.pop-close',function(){
				$('#J-changep').hide();
				$('#J-JY').hide();
				$("input[name='password1']").val('');
				$("input[name='password2']").val('');
				$("input[name='password3']").val('');
				$("input[name='Jpassword1']").val('');
				$("input[name='Jpassword2']").val('');
				$("input[name='Jpassword3']").val('');
			});
			//修改登录密码
			$('#changepassword').on('click',function(){
				var password1 = $("input[name='password1']").val();
				var password2 = $("input[name='password2']").val();
				var password3 = $("input[name='password3']").val();		
				if(!password1){
					G.toast('请您输入旧密码');
					return false;
				}else if(password1.length < 6){
					G.toast('旧密码的位数不能小于6位');
					return false;
				}else if(!password2){
					G.toast('请您输入新密码');
					return false;
				}else if(password2.length < 6){
					G.toast('新密码的位数不能小于6位');
					return false;
				}else if(!password3){
					G.toast('请您输入确认新密码');
					return false;
				}else if(password3.length < 6){
					G.toast('确认新密码的位数不能小于6位');
					return false;
				}else if(password2 != password3){
					G.toast('两次输入新的密码不一致');
					$("input[name='password2']").val('');
					$("input[name='password3']").val('');
					$("input[name='password2']").focus();
					return false;
				}else{
					var postData = JSON.stringify({
		                'u1': webAppInfo.user_id,
		                'u2': webAppInfo.us_token,
		                'u3': $.md5(password2),
		                'u4': $.md5(password1),
		                'u5': 'B0001',
		                'u6': webAppInfo.user_type
		            });
		            var subtime = new Date().getTime()+"";
		            var params = {
		                userVerify: _this.encodeStr(postData, subtime),
		                unixkey: subtime
		            }; 
					G.post(Service.userModifyPwd,params,function(data){
						if(data.returnCode == 1){
							var newmsg = data.returnMsg + ',请重新登录！';
							$('.mask').hide();
							G.$alert(newmsg,true,function(){
								G.goLogin();
							},true);
						}else{
							G.toast(data.returnMsg);
						}		
					});
				}
			});
		}
	}
	return safety.init();
});