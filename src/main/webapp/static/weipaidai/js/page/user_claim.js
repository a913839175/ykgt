define(function(require, exports, module){
	var pagination = require('pagination');
	var Handlebars = require('handlebars');
	var itemTpl = require('tpl/myinvestList2.tpl');
	var itemTpl2 = require('tpl/myloanList.tpl');
    var itemTpl3 = require('tpl/dqhkList.tpl');
	require('page/account_common.js');
	var params = {
		page:1,
		epage:5,
		status:1
	};
    var expire_account = $("#expire_account").html();
    var params4 = {
        tender_id: '',
        expire_account:expire_account,
        ip:getIpAddr||"",
        smsCode:'',
        smsPhone:''
    };
	var bindFlag = true;
	var renderData = function(params){
		G.showLoading();		
		G.get(Service.hisrecordList,params,function(data){
			// console.log(data);
			$.each(data.lists,function(k,v){
				v.contract_name = G.imagesURl +'/oldpdf/'+ v.contract_name;
			});
			var itemHtml = Handlebars.compile(itemTpl);
		    $("#hisrecordList").html(itemHtml(data));
		    G.hideLoading();
		    if(bindFlag){
		    	if(data.total){
		    		$('.M-box').show();
		    	}else{
		    		$('.M-box').hide();
		    	}
		    	$('.M-box').pagination({
				    totalData:data.total,
				    showData:5,
				    coping:true,
				    callback:function(api){
				    	bindFlag = false;
				    	//再次渲染列表
				    	params.page = api.getCurrent();
				    	renderData(params);
				    }
				});
		    }	    		
		});
	};
	renderData(params);
	var renderList = function(borrowNid){
		G.get(Service.myloanList,{
			borrow_nid: borrowNid
		},function(data){
			if(data.lists){
				$('#J_myinvest_box').show();
				var itemHtml = Handlebars.compile(itemTpl2);
		    	$("#poptdList").html(itemHtml(data));
			}
			
		});
	};
	$('.tab-nav-item').on('click',function(){
		var index = $(this).index()+1;
		$(this).addClass('active').siblings().removeClass('active');
		bindFlag = true;
		params.status = index;
		params.page = 1;
		renderData(params);
	});
	$(document).on('click','.datil',function(){	
    	var borrowNid = $(this).attr('data-id');
    	renderList(borrowNid);	
    });
	$(document).on('click','#pop_box_close',function(){	
    	$('#J_myinvest_box').hide();	
    });
    //赎回金额打开
    $(document).on('click','.hbshouyi_p6',function(){
        params4.tender_id = $(this).attr("data-id");
        var expire_account = parseInt($("#expire_account").html());
        if(!expire_account){
            G.$alert("没有可赎回的历史债权",false);
            return false;
        }	
    	$('#maxje1').show();	
    });
    //赎回金额关闭
    $(document).on('click','.redmoney02',function(){	
    	$('#maxje1').hide();	
    });
    //获取用户历史金额
    G.post(Service.get_old_account,{},function(data){
    });
    var params2 = {
        page:1,
        epage:5
    };
    var bindFlag2 = true;
    var dqhkList = function(params2){
        G.post(Service.oldtenderlist,params2,function(data){
            if(data.lists){
                var itemHtml = Handlebars.compile(itemTpl3);
                data.listType = true;     
                $.each(data.lists,function(k,item){                          
                    item.timestamp = util.formatDate(parseInt(item.time)*1000);
                });
                $("#expiretbody").html(itemHtml(data));
                if(bindFlag2){
                    $('.M-box2').pagination({
                        totalData:data.total,
                        showData:5,
                        coping:true,
                        callback:function(api){
                            bindFlag2 = false;
                            //再次渲染列表
                            params2.page = api.getCurrent();
                            dqhkList(params2);
                        }
                    });
                }
            }        
        });
    };
    //到期记录
    $("#dqhkBtn").on('click',function(){
        $("#maxje2").show();
        dqhkList(params2);
    });
    $(".redmoneyx02").on('click',function(){
        $('.mask').hide();
    });
    var params3 = {
        page:1,
        epage:5
    };
    var bindFlag3 = true;
    var oldredeemList = function(params3){
        G.post(Service.oldredeemlist,params3,function(data){
            if(data.lists){
                var itemHtml = Handlebars.compile(itemTpl3);
                data.listType = false;  
                $.each(data.lists,function(k,item){
                    item.timestamp = util.formatDate(parseInt(item.time)*1000);
                });
                $("#oldredeemList").html(itemHtml(data));
                if(bindFlag3){
                    $('.M-box3').pagination({
                        totalData:data.total,
                        showData:5,
                        coping:true,
                        callback:function(api){
                            bindFlag3 = false;
                            //再次渲染列表
                            params3.page = api.getCurrent();
                            oldredeemList(params3);
                        }
                    });
                }
            }        
        });
    };
    //赎回记录
    $("#shjlBtn").on('click',function(){
        $('#maxje3').show();
        oldredeemList(params3);
    });
    $(".sruesh").on('click',function(){
        $(".sruesh").addClass("btn-disable").attr("disabled","true");
        params4.smsCode = $("#smsInput").val();
        params4.smsPhone = $("#shphone").val();
        if(!params4.smsCode){
            G.$alert("手机验证码不能为空",false);
            $(".sruesh").removeClass("btn-disable").removeAttr("disabled");
            return false;
        }
        G.post(Service.use_old_tender,params4,function(data){
            $(".sruesh").removeClass("btn-disable").removeAttr("disabled");
            if (data.returnCode == "1") {
                $('.mask').hide();
                G.$alert(data.returnMsg, true,function(){
                    window.location.reload();
                },true);
            } else {
                G.$alert(data.returnMsg, false);
            }
        });
    });
    //发送验证码
    var nums = 120;
    var timer = null;
    function sendSms(code) {
        if (nums === 0) {
            code.removeClass('gray-bg').removeAttr("disabled").html("获取验证码"); 
            nums = 120;
            clearTimeout(timer);
            return;
        } else {
            code.addClass('gray-bg').attr("disabled","true").html(nums + "秒后重新发送");
            code.html(nums + "秒后重新发送");
            nums--;
        }
        timer = setTimeout(function() {
            sendSms(code);
        }, 1000);
    }
    var shphone = $("#shphone").val();
    $("#smscode").on('click',function(){
        var code = $(this);
        if (!shphone) {
            G.$alert("手机号不能为空！", false);
            return false;
        }
        code.addClass('gray-bg').attr("disabled","true");
        G.post(Service.sendText, {
            mobile: shphone,
            action: "REDEMPTION"
        }, function(data) {
            // console.log(data)
            if (data.result == 1) {
                sendSms(code);
            }else{
                code.removeClass('gray-bg').removeAttr("disabled")
                alert(data.message);
            }
        });
    });
});