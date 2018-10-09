define(function(require, exports, module){
	var Validform = require('Validform');
    var MD5 = require('MD5');
    var JSEncrypt = require('JSEncrypt');
	//发送验证码
	var nums = 120;
	var timer = null;
    var $myselect = $("#myselect");
    var encodeStr = function(STR,TOKEN){
        return JSEncrypt(STR,PAGENAME,TOKEN,PAGEWEB);
    };
    function sendYzm(code) {
        if (nums == 0) {
            code.removeClass('yash07').removeAttr("disabled").html("获取验证码");
            nums = 120;
            clearTimeout(timer);
            return;
        } else {
            code.addClass('yash07').html(nums + "秒后重新发送");
            nums--;
        }
        timer = setTimeout(function () {
            sendYzm(code);
        }, 1000);
    }
    //点击领取验证码
	$('.yash06').on('click',function(){
		var mobile = $('.yash04').val();       
        var code = $(this);
        var $phoneErr = $('.yash04').siblings('.Validform_checktip');
        if(!mobile || $phoneErr.hasClass('Validform_wrong')){
            $("#btn_findPwd").submit();
            return false;
        }else{
            code.attr("disabled","true");
            G.post(Service.sendText, {mobile: mobile,action: "BACKPWD"}, function(data){
                if(data.result == 1){
                    sendYzm(code);
                }else{
                    code.removeClass('gray-bg').removeAttr("disabled")
                    alert(data.message);
                }                       
            },function(data){
                code.removeAttr("disabled");
            });  
        }
        	
	});
	//找回密码1
	var findPwd = $('.yash').Validform({
		btnSubmit:"#btn_findPwd",
        tiptype: 3,
        ajaxurl:{
            name:true,
            success:function(data,obj){
                var ustype = $("#myselect").attr("data-value");
                $("#btn_findPwd").removeAttr("disabled");
                if(data.result==="1"){
                    obj[0].validform_valid="true";
                    $('.phonename').find('.Validform_checktip').addClass('Validform_right').removeClass('Validform_wrong Validform_loading').html("&nbsp;");
                    
                }else{
                    if(ustype == "01"){
                        data.errorMsgInfo = "投资账号不存在";
                    }else{
                        data.errorMsgInfo = "借款账号不存在";
                    }
                    obj[0].validform_valid=data.errorMsgInfo;
                    $('.phonename').find('.Validform_checktip').removeClass("Validform_right Validform_loading").addClass('Validform_wrong').html(data.errorMsgInfo);
                    return false;
                }
            }
        },
		beforeSubmit:function(curform){			
			findpwdFn();
		}
	});
	//第一步的确认点击
	var findpwdFn = function(){
        var mobile = $('.yash04').val();
        var smsCode = $('.yash05').val();
        var params = {
            'mobile':mobile, 
            'code_type':"BACKPWD", 
            'smsCode':smsCode
        };
        G.post(Service.verifyRandCode, params, function(data){
            // console.log(data)
            if(data.returnCode=="1"){
                $('.yash').hide();
                $('.yash2').show();
                $('.yash3').hide();                                              
            }else if(data.returnMsg.indexOf("验证码") > -1){
                $('.yash05').find('input').addClass('Validform_error');
                $('.yash05').siblings('.Validform_checktip').removeClass("Validform_right").addClass('Validform_wrong').html(data.returnMsg);           
            }else{
                G.$alert(data.returnMsg,false);
            }
        });
			
	};
	//信息验证
	$('.yash2').Validform({
		btnSubmit:".yash09",
		tiptype: 3,
		beforeSubmit:function(curform){
			var num = $('.yash04').val();
			var newpwd = $.md5($('#repassword').val());
            var user_type = $("#myselect").attr("data-value");
            var param = JSON.stringify({
                u1: num,
                u2: $('.yash05').val(),
                u3: newpwd,
                u4: user_type
            });
            var subtime = new Date().getTime()+"";
    		G.post(Service.userBackPwd,{
                userVerify:encodeStr(param,subtime),
                unixkey:subtime
            },function(data){
    			if(data.returnCode == 1){
    				$('.yash').hide();
    				$('.yash2').hide();
    				$('.yash3').show();
    			}else{
    				G.$alert(data.returnMsg,false);
    			}
    		});		
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
    });
    var checkPhone = function(){
        var $uphone = $(".yash04");
        var username = $uphone.val();
        var objtip = $uphone.siblings(".Validform_checktip");
        var usertype = $myselect.attr("data-value");
        if(!username){
            return false;
        }
        G.post(Service.checkUsername,{
            username:username,
            user_type:usertype
        },function(data){
            // console.log(data);
            if(data.result == 1){
                objtip.addClass("Validform_right").removeClass("Validform_wrong").html("&nbsp;");
                $uphone.removeClass("Validform_error");
                $("#btn_findPwd").removeAttr("disabled");  
                findPwd.ignore(".yash04");         
            }else{
                if(usertype == "01"){
                    objtip.html("投资账号不存在");
                }else{
                    objtip.html("借款账号不存在");
                }
                objtip.addClass("Validform_wrong").removeClass("Validform_right");
                $uphone.addClass("Validform_error");
                $("#btn_findPwd").attr("disabled","true");              
            }
        });
    };		
});

