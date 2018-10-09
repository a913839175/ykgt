define(function(require, exports, module) {
	var Validform = require('Validform');
		require('passwordStrength');
	var selectFilter = require('selectFilter');
	var MD5 = require('MD5');
	var JSEncrypt = require('JSEncrypt');
	var EnPlaceholder = require("EnPlaceholder");
	var $useP = $('#user_phone'),
		$psw = $('#password'),
		$repsw = $('#repassword'),
		$vcode = $('#valicode'),
		$refer = $('#referees');
	var err_code = $vcode.siblings('.Validform_checktip');
	var $myselect = $("#myselect");
	var user_id = $('#userid').val();

	var App = function() {
		var encodeStr = function(STR, TOKEN) {
			return JSEncrypt(STR, PAGENAME, TOKEN, PAGEWEB);
		};
		return {
			/**
			 * 初始化入口
			 * 
			 */
			init: function() {
				if (user_id) {
					G.post(Service.realnameinfo, {user_id: user_id}, function(data) {
						$.each(data, function(item, key) {
							key && $("#"+item).val(data[item]);
						});
					});					
				}
				this.bindEvent();
			},
			regFun: function() {
				var self = this;
				var flag = false;
				var uphone = $useP.val(),
					password = $.md5($psw.val()),
					code = $vcode.val(),
					userType = "A00"+$myselect.attr('data-value'),
					refer = $refer.val()||'';
				var postData = JSON.stringify({
					'u1': uphone,
					'u2': password,
					'u3': userType,
					'u4': "B0001",
					'u5': code,
					'u6': refer,
					'u7': getIpAddr||"" 
				});
				var subtime = new Date().getTime()+"";
				var params = {
					CSRFTOKEN: encodeStr(postData, subtime),
					subtime: subtime,
					uuid: CSRFTOKEN
				};
				G.post('/api/reg', params, function(data) {
					if (data.returnCode == "1") {
						self.loginFun(data.returnMsg, uphone, password);
					} else if (data.returnMsg.indexOf("验证码") > -1) {
						$vcode.find('input').addClass('Validform_error');
						err_code.removeClass("Validform_right").addClass('Validform_wrong').html(data.returnMsg);
					} else {
						G.$alert(data.returnMsg, false);
					}
				});
			},
			regFun2: function() {
				var flag = false;
				var userid = $('#userid').val(),
					realname = $('#realname').val(),
					idno = $("#idno").val(),
					reservePhone = $("#reservePhone").val(),
					cardBumber = $("#cardBumber").val().replace(/\s+/g, ""),
					payPwd = $.md5($("#payPwd").val()),
					areaCode = $('.reg-city').find('.filter-title').attr('data-code');
				if (!userid) {
					G.$alert("账号不存在,请重新注册", false, function() {
						window.location.href = '/user/reg';
					});
					return false;
				}
				var postData = JSON.stringify({
					'u1': userid,
					'u2': realname,
					'u3': idno,
					'u4': reservePhone,
					'u5': cardBumber,
					'u6': 'B0001',
					'u7': DomainURL + '/user/reg/regsuss',
					'u8': payPwd,
					'u9': areaCode
				});
				var subtime = new Date().getTime()+"";
				var params = {
					CSRFTOKEN: encodeStr(postData, subtime),
					subtime: subtime,
					uuid: CSRFTOKEN
				};
				$("#btn_reg2").addClass("btn-disable").attr("disabled","true");
				G.showLoading();
				G.post('/api/realNameReg', params, function(data) {
					G.hideLoading();
					if (data.returnCode == "1") {
						var url = DomainURL + '/user/reg/regsuss';
						window.location.href = url;
					} else {
						G.$alert(data.returnMsg, false);
						$('#btn_reg2').removeClass("btn-disable").removeAttr("disabled");
					}
				},function(data){
					$('#btn_reg2').removeClass("btn-disable").removeAttr("disabled");
				});
			},
			loginFun: function(returnMsg, uphone, password) {
				var self = this;
				G.$alert(returnMsg, true, function() {
					var postData = JSON.stringify({
						u1: uphone,
						u2: password,
						u3: $myselect.attr('data-value')
					});
					var subtime = new Date().getTime() + "";
					var params = {
						CSRFTOKEN: encodeStr(postData, subtime),
						subtime: subtime,
						uuid: CSRFTOKEN
					};
					G.post('/api/login', params, function(data) {
						if (data.result == "1") {
							window.location.href = '/user/reg/realname';
						} else {
							G.$alert(data.errorMsgInfo, false);
						}
					});
				});
			},
			//事件绑定
			bindEvent: function() {
				var self = this;
				$('#idCode').click(function() {
					var uphone = $useP.val();
					var code = $(this);
					var $phoneErr = $('#user_phone').siblings('.Validform_checktip');
					if (!uphone || $phoneErr.hasClass('Validform_wrong')) {
						$("#btn_reg").submit();
						return false;
					}
					var params = {
						mobile: uphone,
						action: "regist"
					};
					G.sendText(params,code);
				});
				$(document).on('click','.PasswordEyes',function(){
			        $(this).toggleClass('on');
			        try{
			            if($(this).hasClass("on") && $("#password").length){
			                document.getElementById("password").type = "text";            
			            }else{
			                document.getElementById("password").type = "password"; 
			            }
			        }catch(e){
			            alert(e.description);
			        }      
			    });
			    $('body').on('click', function() {
					$('.select.is-open').removeClass('is-open');
				});
				//注册1
				var regForm = $('.registerform').Validform({
					btnSubmit: "#btn_reg",
					tiptype: 3,
					usePlugin: {
						passwordstrength: {
							minLen: 6,
							maxLen: 20, //设置密码长度最大值，默认为30;
							trigger: function(obj, error) {
								if (error) {
									obj.parent().find(".Validform_checktip").show();
									obj.parent().find(".passwordStrength").hide();
								} else {
									obj.parent().find(".Validform_checktip").hide();
									obj.parent().find(".passwordStrength").show();
								}
							}
						}
					},
					datatype: {
						"agree": function(gets, obj, curform, regxp) {
							if (!curform.find("input[name='" + obj.attr("name") + "']:checked").length) {
								return false;
							}
						}
					},
					beforeSubmit: function(curform) {
						self.regFun();
					}
				});
				//注册2
				var regForm2 = $('.registerform2').Validform({
					btnSubmit: "#btn_reg2",
					tiptype: 3,
					beforeSubmit: function(curform) {
						self.regFun2();
					}
				});
				$myselect.on('click', '.select-option', function(e) {
					var parent = $(this).closest('.select');
					if (!parent.hasClass('is-open')) {
						parent.addClass('is-open');
						$('.select.is-open').not(parent).removeClass('is-open');
					} else {
						parent.removeClass('is-open');
					}
					e.stopPropagation();
				}).on('click', 'ul>li', function() {
					var value = $(this).attr('data-value');
					var parent = $(this).closest('.select');
					$('.select').attr('data-value', value);
					parent.removeClass('is-open').find('.select-option').text($(this).text());
					$(this).addClass('is-select').siblings().removeClass('is-select');
					checkPhone();
					if(value=="01"){
						$(".invitBox").show();
					}else{
						$(".invitBox").hide();
					}
				});
				var checkPhone = function(){
					var $uphone = $("#user_phone");
					var username = $uphone.val();
					var objtip = $uphone.siblings(".Validform_checktip");
					var usertype = $myselect.attr("data-value");
					if(!username){
						return false;
					}
					G.post(Service.checkUsername,{username:username,user_type:usertype},function(data){
						if(data.result == 1){
							if(usertype == "01"){
								objtip.html("投资账号已存在");
							}else{
								objtip.html("借款账号已存在");
							}
							objtip.addClass("Validform_wrong").removeClass("Validform_right");
							$uphone.addClass("Validform_error");
							$("#btn_reg").attr("disabled","true");
						}else{
							objtip.addClass("Validform_right").removeClass("Validform_wrong").html("&nbsp;");
							$uphone.removeClass("Validform_error");
							$("#btn_reg").removeAttr("disabled");
						}
					});
				};

				var select = $('.reg-area').selectFilter({
					callBack : function (val){
						//返回选择的值
						var cityList = [];
						var html = '';
						$('.reg-city').find('.filter-title').val('');
						G.post(Service.areaList, {}, function(data) {						
							$.each(data.list,function(k,v){
								if(v.area_code == val){
									cityList=v.lists;
								}							
							});
							$.each(cityList,function(k,v){
								html += '<li data-value="'+v.city_code+'"><a title="'+v.city_name+'">'+v.city_name+'</a></li>';						
							});
							html += '';
    						$('.reg-city .filter-list').html(html);
						});
					}
				});
				$('.reg-city').on('click', '.filter-text', function (){
			        $('.reg-city').find('.filter-list').slideToggle(100);
			        $('.reg-city').find('.filter-list').toggleClass('filter-open');
			        $('.reg-city').find('.icon-filter-arrow').toggleClass('filter-show');
			    });
			    $('.reg-city').on('click', '.filter-list li',function (){
			        var val = $(this).data('value');
			        var valText =  $(this).find('a').html();
			        $('.reg-city').find('.filter-title').val(valText);
			        $('.reg-city').find('.filter-title').attr('data-code',val);
			        $('.reg-city').find('.icon-filter-arrow').toggleClass('filter-show');
			        $(this).addClass('filter-selected').siblings().removeClass('filter-selected');
			        $(this).parent().slideToggle(50);
			    });
			}
		};
	}();
	G.onReady(App);
});