define(function(require, exports, module) {
    require('WdatePicker');
    var pagination = require('pagination');
    var Handlebars = require('handlebars');
    var FinishedTpl = require('tpl/FinishedRepayList.tpl');
    var itemTpl = require('tpl/recordList.tpl');
    require('page/account_common.js');
    var sbindFlag = true;
    var bindFlag = true;
 
    var dparams = {
        epage:5,
        page:1
    };
    // 还款记录
    var renderData2 = function(params){
        G.get(Service.getFinishedRepayList,dparams,function(data){
            // console.log(data)         
            var itemHtml = Handlebars.compile(FinishedTpl);
            $("#FinishedRepayList").html(itemHtml(data));
            //分页
            if(sbindFlag){
                $('.M-box2').pagination({
                    totalData: data.total,
                    showData: 5,
                    coping: true,
                    callback: function(api) {
                        //再次渲染列表
                        sbindFlag = false;
                        dparams.page = api.getCurrent();
                        renderData2(params);
                    }
                });
            }           
        });     
    };
    renderData2(params);
    //默认为最近一个月
    var today = new Date();
    var preDate = new Date();
        preDate.setDate(today.getDate()-30);
    var endTime = G.formatTime(today,"yyyy-MM-dd"),
        startTime = G.formatTime(preDate,"yyyy-MM-dd");

    $('#end_time').val(endTime);
    $('#start_time').val(startTime);
    //交易记录
    var params = {
        start_date:startTime,
        end_date:endTime,
        sortType:1,
        sortDirect:'desc',
        epage:5,
        page:1
    };

    //初始化交易记录列表
    var renderData = function(params){
        G.get(Service.recordList,params,function(data){
            if(data.lists){
                $.each(data.lists,function(index,item){
                    item.status = true;
                    var strs = [];
                    strs=data.lists[index].stime.split(" "); 
                    item.stime1 = strs[0];
                    item.stime2 = strs[1];
                });
            }           
            var itemHtml = Handlebars.compile(itemTpl);
            $("#recordList").html(itemHtml(data));
            //分页
            if(bindFlag){
                $('.M-box').pagination({
                    totalData: data.total,
                    showData: 5,
                    coping: true,
                    callback: function(api) {
                        //再次渲染列表
                        bindFlag = false;
                        params.page = api.getCurrent();
                        renderData(params);
                    }
                });
            }           
        });     
    };
    renderData(params);
    //排序
    $('.sort').on('click',function(){
        var index = $(this).index('.sort');
        var sort = 'desc';
        if($(this).find('.sp1img1').hasClass("active")){
            $(this).find('.sp1img1').removeClass("active");
            sort = 'desc';
        }else{
            sort = 'asc';
            $(this).find('.sp1img1').addClass("active");
        }
        params.sortDirect = sort;
        params.sortType = parseInt(index + 1);
        params.page = $('.M-box').find('span.active').html();
        bindFlag = false;
        renderData(params);
    });

    //页面刚开始加载时，金额的可见状态
    $(document).ready(function() {

        $('#hidden_toggle').on('click', function() {
            var $num = $('.toalData').find('.num');         
            G.get(Service.UserDisplay, {
                user_id: $('#userid').val()
            }, function(data) {
                if (data.display_status !== '2') {
                    $('.eyes').removeClass('on');
                    $.each($num,function(index,item){
                        var numData = $(item).attr("data-title");
                        $(item).text(numData);
                    });         
                } else {
                    $('.eyes').addClass('on');
                    $num.text("*****");
                }
            });
        });

        $('#start_time').on('focus',function(){
            new WdatePicker({
                onpicked: function(){
                    // $('#end_time').focus();
                },
                maxDate: "#F{$dp.$D(\'end_time\')}"
            });
        });

        $('#end_time').on('focus',function(){
            WdatePicker({
                onpicked: function(e){
                    params.start_date = $dp.$('start_time').value;
                    params.end_date = e.cal.getNewDateStr();
                    params.page = $('.M-box').find('span.active').html();
                    renderData(params);
                },
                minDate: '#F{$dp.$D(\'start_time\')}'
            });
        });

        $('#recharge').on('click',function(){
            clickFn('recharge');
        });
        $('#withdrawNow').on('click',function(){
            clickFn('kiting');
        });
        var clickFn = function(type){
            if(G.UserInfo.realname_flag !== "1"){
                G.$alert("请完成实名认证再进行充值，立即认证？",false,function(){
                    window.location = '/user/reg/realname';
                });
            }else if(G.UserInfo.bank_flag !== "1"){
                G.$alert("请先绑卡再进行操作，立即绑卡？",false,function(){
                    window.location = '/user/safety';
                });
            }
            else{
                window.location = '/user/'+type;
            }
        };
    });
});
