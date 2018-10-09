define(function(require, exports, module){
	require('Clipboard');
	require('socialShare');
	require('page/account_common.js');
    require('WdatePicker');
    var pagination = require('pagination');
    var Handlebars = require('handlebars');
    var itemTpl = require('tpl/user_invite.tpl');
    var itemTpl2 = require('tpl/user_invite2.tpl');
    
    //默认为最近一个月
    var today = new Date();
    var preDate = new Date();
        preDate.setDate(today.getDate()-30);
    var endTime = G.formatTime(today,"yyyy-MM-dd"),
        startTime = G.formatTime(preDate,"yyyy-MM-dd");
    $('#end_time').val(endTime);
    $('#start_time').val(startTime);
    $('#end_time2').val(endTime);
    $('#start_time2').val(startTime);

    var params = {
        page: 1,
        epage:5,
        mobile:'',
        user_name:'',
        start_date:$('#start_time').val(),
        end_date:$('#end_time').val()
    };
    var params2 = {
        page: 1,
        epage:5,
        start_date:$('#start_time2').val(),
        end_date:$('#end_time2').val()
    };
    var bindFlag = true;
	$('#copyUrl').on('click', function(e){
		$(this).focus();
		$(this).select();
    });
    try{
		var clipboard = new Clipboard('.copy-btn');
	    clipboard.on('success', function(e) {   	
	    	G.$alert('☺复制成功，可通过Ctrl+V进行粘贴!');
	    });
	    clipboard.on('error', function(e) {
		    G.$alert('😐复制失败，请选择手动Ctrl+C复制!',false);
		});
    }catch(e){
    	$('.copy-btn').on('click',function(){
    		$('#copyUrl').focus();
			$('#copyUrl').select();
    		G.$alert('😐复制失败，请选择手动Ctrl+C复制!',false);
    	});		
    }
    var shareUrl = encodeURIComponent($('#copyUrl').val());
    var sharePic = DomainURL + $('#Imagewm').attr('src');
    $("#J-share").socialShare({
     	title:'送你188元红包大礼，银行存管更安全',
        url: shareUrl,
        pic: sharePic, 
        ewmurl: sharePic,   
        content: "%23微拍贷%23现在注册即送188元新手礼包、0.1%加息红包和100微币！还有更多活动福利等你来领哦~"
    });

    //初始化好友投资记录的
    var renderData = function(url,params,itemTpl,id,pageclass){
        G.get(url,params,function(data){
            if(data.lists.length){
                $('.page').show();
                $.each(data.lists,function(index,item){
                    var reg = /^[0-9]+.?[0-9]*$/;
                    if (reg.test(item.user_name)) {
                        item.user_name2 = '';
                    }else{
                        item.user_name2 = item.user_name;
                    }
                })
            } else{
                $('.page').hide();
            }  
            var itemHtml = Handlebars.compile(itemTpl);
            $(id).html(itemHtml(data));
            if(bindFlag){
                if(data.total){
                    $(pageclass).show();
                }else{
                    $(pageclass).hide();
                }
                $(pageclass).pagination({
                    totalData: data.total,
                    showData: 5,
                    coping: true,
                    callback: function(api){
                        //再次渲染列表
                        bindFlag = false;
                        params.page = api.getCurrent();
                        renderData(url,params,itemTpl,id,pageclass);
                    }
                });
            }
        });
    } 
    renderData(Service.get_friend_loan_list,params,itemTpl,'#friendtbody','.M-box1');

    // 好友投资详情与累计邀请人数tab切换 
    $('.friendli').on('click',function(){
        var index=$(this).index();
        var newclass=".table"+index;
        $(this).addClass('friendliactive').siblings().removeClass('friendliactive');
        $('.tableclass').hide();
        $(newclass).show();
        if(index == 0){
             params.mobile = $('.tablehead04').val();
             params.user_name = $('.tablehead02').val();
             params.start_date = $('#start_time').val();
             params.end_date = $('#end_time').val();
             bindFlag = true;
             renderData(Service.get_friend_loan_list,params,itemTpl,'#friendtbody','.M-box1');
        }else if(index == 1){
             params.start_date = $('#start_time2').val();
             params.end_date = $('#end_time2').val();
             bindFlag = true;
             renderData(Service.get_friend_list,params2,itemTpl2,'#friendtbody2','.M-box2');
        }        
    }) 
    //好友投资详情 开始时间 
    $('#start_time').on('focus',function(){
        new WdatePicker({
            onpicked: function(){
                // $('#end_time').focus();
            },
            maxDate: "#F{$dp.$D(\'end_time\')}"
        });
    });
     //好友投资详情 结束时间 
    $('#end_time').on('focus',function(){
        WdatePicker({
            onpicked: function(e){
                // params.end_date = e.cal.getNewDateStr();
                // params.page = $('.M-box').find('span.active').html();
                // renderData(params);
            },
            minDate: '#F{$dp.$D(\'start_time\')}'
        });
    });
    //累计邀请 开始时间
     $('#start_time2').on('focus',function(){
        new WdatePicker({
            onpicked: function(){
            },
            maxDate: "#F{$dp.$D(\'end_time2\')}"
        });
    });
     //累计邀请 结束时间
    $('#end_time2').on('focus',function(){
        WdatePicker({
            onpicked: function(e){
            },
            minDate: '#F{$dp.$D(\'start_time2\')}'
        });
    });
   
    $('.tablehead09').on('click',function(){
        params.mobile = $('.tablehead04').val();
        params.user_name = $('.tablehead02').val();
        params.start_date = $('#start_time').val();
        params.end_date = $('#end_time').val();
        bindFlag = true;
        renderData(Service.get_friend_loan_list,params,itemTpl,'#friendtbody','.M-box1');
    })
    //累计邀请人数  
    $('.tablehead99').on('click',function(){
        params2.start_date = $('#start_time2').val();
        params2.end_date = $('#end_time2').val();
        bindFlag = true;
        renderData(Service.get_friend_list,params2,itemTpl2,'#friendtbody2','.M-box2');
    })
});