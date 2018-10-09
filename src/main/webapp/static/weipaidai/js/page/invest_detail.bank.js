define(function(require, exports, module){
    var EnPlaceholder = require("EnPlaceholder");
    var select = require('select');
    var pagination = require('pagination');
    var Validform = require('Validform');
    var Handlebars = require('handlebars');
    var itemTpl = require('tpl/accurate.tpl');
    var itemTpl3 = require('tpl/productList.tpl');
    var sbhb = require('tpl/sbhb.tpl');
    var sbtable = require('tpl/sbtable.tpl');
    var $myselect = $(".myselect").select();
    var balance = $('.balance').val();
    var poshytip = require('poshytip');
    var JSEncrypt = require('JSEncrypt');
    var MD5 = require('MD5');
    var windowH = $(document).height();
    var encodeStr = function(STR,TOKEN){
        return JSEncrypt(STR,PAGENAME,TOKEN,PAGEWEB);
    };    
    //发送验证码
    var nums = 120;
    var timer = null;
    var time1 = 1;
    var timer2 = null;
    var time2 = 1;
    function sendSms(code) {
        if (nums == 0) {
            code.removeClass('gray-bg').removeAttr("disabled").html("获取验证码");    
            nums = 120;
            clearTimeout(timer);
            return false;
        } else {
            code.addClass('gray-bg').attr("disabled","true").html(nums + "秒后重新发送");
            nums--;
        }
        timer = setTimeout(function () {
            sendSms(code);
        }, 1000);
    }
    //发送短信
    $(document).on('click','.hqdx',function(){
        var uphone = $(".phoneq").text();
        var investInput = $('#investInput').val();
        var code = $(this);
        var $phoneErr = $('#investInput').siblings('.Validform_checktip');
        if(!investInput || $phoneErr.hasClass('Validform_wrong')){
            $("#sbshop").submit();
            return false;
        };
        code.html('短信发送中..');          
        G.post(Service.sendText, {
            mobile: uphone,
            action: "TENDER"
        }, function(data){
            // 
            if(data.result == 1){
                sendSms(code);
            }else{
                code.removeClass('gray-bg').removeAttr("disabled")
                alert(data.message);
            }                               
        });
    });
    $(document).on('click','.hqdx2',function(){
        var uphone = $(".phoneq2").text();
        var code = $(this);
        code.html('短信发送中..');          
        G.post(Service.sendText, {
            mobile: uphone,
            action: "TENDER"
        }, function(data){
            // 
            if(data.result == 1){
                sendSms(code);
            }else{
                code.removeClass('gray-bg').removeAttr("disabled")
                alert(data.message);
            }                             
        });
    });
    //进度条加载
    G.progress();
    $(window).scroll(function() {
        G.progress();
    });
    $('.insertwenh').poshytip({
        alignX: 'right'
    });

    var nid = $('.nid').val();
    var stype = $('.stype').val();

    if(stype == 'shut'){
        var params = {
            shut_id:nid,
            epage:10,
            page:1
        };
    }else if(stype == 'loan'){
        var params = {
            loan_nid:nid,
            epage:10,
            page:1
        };   
    }
    var params2 = {
        shut_id:nid,
        epage:5,
        page:1  
    };
    //精准投资
    var bindFlag1 = true;
    var renderData = function(params){
        G.get(Service.product_borrow_nid_list,params2,function(data){
            //;
            var itemHtml = Handlebars.compile(itemTpl);
            $("#AccurateList").html(itemHtml(data));           
            if(bindFlag1){
                $('.M-box1').pagination({
                    totalData:data.total,
                    showData:5,
                    coping:true,
                    callback:function(api){
                        bindFlag1 = false;
                        //再次渲染列表
                        params2.page = api.getCurrent();
                        renderData(params2);
                    }
                });
            }
        });     
    };
    if(stype == 'shut'){
        renderData(params2);
    }
    //投资记录
    var bindFlag2 = true;
    var renderData2 = function(params){
        if(stype == 'shut'){
            G.get(Service.getproductList,params,function(data){
                var pages = data.total;
                $.each(data.lists,function(k,item){
                    item.page = params.epage*(params.page-1) + k + 1;
                });
                var itemHtml = Handlebars.compile(itemTpl3);
                $("#Investorform").html(itemHtml(data));
                if(bindFlag2){
                    $('.M-box2').pagination({
                        totalData:pages,
                        showData:10,
                        coping:true,
                        callback:function(api){
                            bindFlag2 = false;
                            params.page = api.getCurrent();
                            renderData2(params);
                        }
                    });
                }
            });
        }else if(stype == 'loan'){
            G.get(Service.borrow_tender_list,params,function(data){
                var pages = data.total;
                $.each(data.lists,function(k,item){
                    item.page = params.epage*(params.page-1) + k + 1;
                });
                var itemHtml = Handlebars.compile(itemTpl3);
                $("#Investorform").html(itemHtml(data));
                if(bindFlag2){
                    $('.M-box2').pagination({
                        totalData:pages,
                        showData:10,
                        coping:true,
                        callback:function(api){
                            bindFlag2 = false;
                            params.page = api.getCurrent();
                            renderData2(params);
                        }
                    });
                }
            });
        }
    };
    renderData2(params); 

    // 输入100整数倍的金额验证
    $(".tenderform").Validform({
        tiptype: 3,
        btnSubmit:"#speedsure",
        datatype:{
            "isNumberBy100":function(gets,obj,curform,regxp){
                var accwait = parseInt($('#accwait').text());
                var AuthorityLimit = $('#AuthorityLimit').html();
                if(gets > parseFloat(accwait)){
                    $('.ui-term-input').val(accwait);
                    $('#zdtdtip').show();
                    return "超过剩余可投金额，数值已变为剩余可投金额";                 
                }
                else if(gets > parseFloat(AuthorityLimit)){       
                    $(".max3").show();
                    $('#oldAl').html($('.Aubuam').val());
                    $('.Alsqmoney02').val('');
                    $('#zdtdtip').hide();
                    return "授权投资额度不足";                 
                }
                else if(gets > parseFloat(balance)){
                    $('#zdtdtip').hide();
                    return "您的余额不足,请<a class='recharge' href='javascript:void(0);' target='_blank'>充值</a>";
                }
                else if((gets < 100 || gets%100 !== 0) && (gets!=parseFloat(accwait))) {
                    $('#zdtdtip').hide();
                    return false;               
                }                
                else {              
                    return true;
                }
            }
        },
        beforeSubmit:function(curform){
            var transAmt1 = parseInt($('.ui-term-input').val());
            var selecto = $('#selecto1');
            var paymoney = $('.paymoney').val()/100;
            var detailList = $('.detailListboxlist').html();
            var amountdue='';
            var hbsy = '';
            var productname = $('.productname').val();
            var productNid = $('.productNid').val();
            if(G.isLogin){    
                $('.max').show().height(windowH);
                $(".maxtz").css("top",G.scrollTop + 50);
                $('.transAmt').html(transAmt1);
                $('#ALshouq').html($('.Aubuam').val());
                if(transAmt1 && transAmt1!=0){
                    var params = {
                        status:0,
                        epage:1000,
                        page:1
                    }
                    G.post(Service.hongbaolist,params,function(data){
                        if(data.total == 0){
                            $('#znone1').show();
                            $('.myselect1').hide();
                            amountdue = Math.floor(transAmt1 * paymoney *detailList * 100)/100;
                            hbsy = 0.00;
                        }else{
                            if(data.lists){
                                var newData = {
                                    lists:[]
                                };
                                $.each(data.lists,function(k,item){
                                    if(transAmt1 >= parseInt(item.use_condition) && item.stype != '现金红包'){
                                        if(item.stype == '加息红包' && transAmt1 <= parseInt(item.use_condition_max) || item.stype == '投资红包'){
                                            if(item.product.indexOf(productname) > -1 || item.product.indexOf(productNid) > -1){
                                                newData.lists.push(item);
                                                $('#znone1').hide();
                                                $('.myselect1').show();
                                                selecto.html(newData.lists[0].title);
                                                selecto.attr('data-account',newData.lists[0].account);
                                                selecto.attr('data-apr',newData.lists[0].apr);
                                                selecto.attr('data-stype',newData.lists[0].stype);
                                                selecto.attr('data-id',newData.lists[0].id); 
                                            } 
                                        }
                                    }else{   
                                        amountdue = Math.floor(transAmt1 * paymoney * detailList * 100)/100;
                                        hbsy = 0.00;
                                    }
                                });
                                if(newData.lists == ""){
                                    $('#znone1').show();
                                    $('.myselect1').hide();
                                }else{
                                    var itemHtml = Handlebars.compile(sbhb);
                                    $('#sul1').html(itemHtml(newData)); 
                                    $('#znone1').hide();
                                    $('.myselect1').show(); 
                                }
                                if(selecto.attr("data-stype") == '投资红包'){
                                    amountdue =  Math.floor((transAmt1 *  paymoney * detailList + parseInt(selecto.attr("data-account"))) * 100)/100;
                                    hbsy = Math.floor(selecto.attr("data-account") * 100) / 100;
                                }else if(selecto.attr("data-stype") == '加息红包'){
                                    amountdue = Math.floor(transAmt1 * paymoney* (detailList*1 + selecto.attr("data-apr")*1) * 100)/100;
                                    hbsy = Math.floor(selecto.attr("data-apr")*transAmt1 * paymoney * 100) / 100;
                                }else{  
                                    amountdue = Math.floor(transAmt1 * paymoney * detailList * 100)/100; 
                                    hbsy = 0.00;
                                }
                            }    
                        }
                        $('.yqsy').html(changeDecimalBuZero(amountdue,2));
                        $('.hbsy').html(hbsy);
                    });
                       
                }
            }else{
                window.location.href = '/user/login?redirectURL='+encodeURIComponent(location.href);
            }         
        }
    });

    $(document).on('click','#zhbBtn',function(){
        if(stype == 'shut'){
            tenderGroup();   
        }else if(stype == 'loan'){
            sbFun();
        }  
    });
    //组合标购买
    var tenderGroup = function(){
        var transAmt = $('.ui-term-input').val();
        var productNid = $('.productNid').val();
        var shutId = $('.nid').val();
        var hongbaoId = $('#selecto1').attr('data-id');
        var balance = $('.balance').val();
        var location = window.location.href;
        var params3 = {
            'transAmt':transAmt, 
            'product':productNid, 
            'shut_id':shutId,
            'hongbao_id':hongbaoId,
            'pay_pwd':$.md5($('#Bycombination').val())
        };
        $('#zhbBtn').addClass('btn-disable').attr("disabled","true");
        G.post(Service.bscg_tender_group, params3, function(data){
                
                if(data.returnCode=="1"){
                    $('.mask').hide();
                    G.$alert(data.returnMsg,true,function(){ 
                         window.location = location; 
                    },true);             
                }
                else{
                    G.$alert(data.returnMsg,false,function(){
                        $('#mask').remove();
                        $('#zhbBtn').removeClass('btn-disable').removeAttr("disabled");
                    },true);
                }           
            }); 
    };   
    //散标投资框里的输入100整数倍的金额验证
    $(".maxtz").Validform({
        tiptype: 3,
        btnSubmit:"#sbshop",
        datatype:{
            "isNumberto100":function(gets,obj,curform,regxp){
                var accwait =  parseInt($('.accwait').val()); 
                var AuthorityLimit = $('#AuthorityLimit').html();
                if(gets > parseFloat(AuthorityLimit)){
                    $(".max3").show();
                    $('#oldAl').html($('.Aubuam').val());
                    $('.Alsqmoney02').val('');
                    $('#jztztip').hide();
                    $('.max1').hide();
                    return "授权投资额度不足"; 
                }
                else if(gets > parseFloat(accwait)){
                    $('#investInput').val(accwait);
                    $('#jztztip').show();
                    return true;
                }
                else if(gets > parseFloat(balance)){
                    $('#jztztip').hide();
                    return "您的余额不足,请<a class='recharge' href='javascript:void(0);' target='_blank'>充值</a>";
                }
                else if((gets < 100 || gets%100 !== 0) && (gets!=parseFloat(accwait))) {
                    $('#jztztip').hide();
                    return false;               
                }                
                else {              
                    return true;
                }
            }
        },
        beforeSubmit:function(curform){         
            sureFun();
        }
    });
    //初始化弹窗
    var MaskinitFun = function(){
        clearTimeout(timer);
        $('#investInput').val('');
        $('#zdtdtip').hide();
        $('#jztztip').hide();
        $('.Validform_checktip').removeClass('Validform_wrong').html('');
        $('#amountdue').html('0');
        $('#znone').show();
        $('.myselect').hide();
        $('.hqdx').removeClass('gray-bg').removeAttr("disabled").html("获取验证码");
        $('#valicode').val('');
        $('.checkedBtn').removeClass('on');
        $('#sbshop').removeClass('btn-disable').removeAttr("disabled");
        $('.kitingbankinx1').val('');
        $('#accurate').val('');
    };
    //精准投资立即购买
    var sureFun = function(){
        var transAmt = parseInt($('#investInput').val());
        var loanNid = $('#sbshop').attr('data-id');
        var smsCode = $("#valicode").val();
        var productNid = $('.productNid').val();
        var hongbaoId = $('#selecto').attr('data-id');
        var balance = $('.balance').val();
        var sbsq = $('#sbsq').val();
        var shutId = $('.nid').val();
        var params3 = {
            'transAmt':transAmt, 
            'product':productNid, 
            'loan_nid':loanNid,
            'hongbao_id':hongbaoId,
            'shut_id':shutId,
            'pay_pwd':$.md5($('#accurate').val())
        };
        $('#sbshop').addClass('btn-disable').attr("disabled","true");
        G.showLoading();
        G.post(Service.bscg_tender_child, params3, function(data){
            G.hideLoading();
            if(data.returnCode=="1"){
                $('.mask').hide();
                var req_uuid=data.requestUrl;
                getstatus(req_uuid);
            }
            else{
                G.$alert(data.returnMsg,false,function(){
                    $('#mask').remove();
                    $('#sbshop').removeClass('btn-disable').removeAttr("disabled");
                    $('#accurate').val(''); 
                },true);
            }           
        });      
    };
    // 产品详细和投资人之间的tab切换
    $('.cpzs_li').on('click', function () {
        var cpindex = $(this).index();
        $(this).addClass('bordercur').siblings().removeClass('bordercur');
        $('.tab-cont').eq(cpindex).show().siblings('.tab-cont').hide();
    });
    
    //确认投资关闭按钮
    $(document).on('click','.mask-close',function(){
        $('.mask').hide();
        MaskinitFun();
        clearTimeout(timer);
        nums = 120;
    });
    $(document).on('click','.ljsure',function(){
        var loanNid = $(this).attr('data-id');
        var accwait = $(this).attr('data-value');
        var loanname=$(this).parents('.AccurateList_li').find('.Anumber01').html();
        $('#loanname').html(loanname);
        if(G.isLogin){
            $('#sbshop').attr('data-id',loanNid);
            $('.accwait').val(accwait);          
            $('.max1').show().height(windowH);
            $(".maxtz").css("top",G.scrollTop + 50);
            $('#sbsq').html($('.Aubuam').val()); 
        }else{
            window.location.href = '/user/login?redirectURL='+encodeURIComponent(location.href);
        }      
    });
    // 组合标的子标预期收益
    $('#investInput').keyup(function (){
        var self = this;
        var money = $(this).val();
        var accwait = parseInt($('.accwait').val());
        var paymoney = $('.paymoney').val()/100;
        var amountdue='';
        var selecto = $('#selecto');
        var detailList = $('.detailListboxlist').html();
        var hbsy = '';
        var productname1 = $('.productname').val();
        var productNid1 = $('.productNid').val();
        if(money > parseFloat(accwait)){
            money = accwait;
        }
        if(money && money!=0){
            var params = {
                status:0,
                epage:1000,
                page:1
            }
            G.post(Service.hongbaolist,params,function(data){
                if(data.total == 0){
                    $('#znone').show();
                    $('.myselect').hide();
                    amountdue = Math.floor(money * paymoney *detailList * 100)/100;
                    hbsy = 0.00;
                }else{
                    if(data.lists){
                        var newData = {
                            lists:[]
                        };
                        $.each(data.lists,function(k,item){
                            if(money >= parseInt(item.use_condition) && money <=parseInt(item.use_condition_max) && item.stype != '现金红包'){  
                                if(item.stype == '加息红包' && money <= parseInt(item.use_condition_max) || item.stype == '投资红包'){
                                    if(item.product.indexOf(productname1) > -1 || item.product.indexOf(productNid1) > -1){
                                        newData.lists.push(item);
                                        $('#znone1').hide();
                                        $('.myselect1').show();
                                        selecto.html(newData.lists[0].title);
                                        selecto.attr('data-account',newData.lists[0].account);
                                        selecto.attr('data-apr',newData.lists[0].apr);
                                        selecto.attr('data-stype',newData.lists[0].stype);
                                        selecto.attr('data-id',newData.lists[0].id); 
                                    } 
                                }
                            }else{
                                amountdue = Math.floor(money * paymoney * 100)/100;
                                hbsy = 0.00;
                            }
                        });
                        if(newData.lists == ""){
                            $('#znone').show();
                            $('.myselect').hide();
                        }else{
                            var itemHtml = Handlebars.compile(sbhb);
                            $('#sul').html(itemHtml(newData)); 
                            $('#znone').hide();
                            $('.myselect').show(); 
                        }
                        if(selecto.attr("data-stype") == '投资红包'){
                             amountdue =  Math.floor((money *  paymoney * detailList + selecto.attr("data-account") * 1) * 100)/100;
                             hbsy = Math.floor(selecto.attr("data-account") * 100) / 100;
                        }else if(selecto.attr("data-stype") == '加息红包'){
                             amountdue = Math.floor(money * paymoney* (detailList*1 + selecto.attr("data-apr")*1) * 100)/100;
                             hbsy = Math.floor(selecto.attr("data-apr")*money * paymoney * 100) / 100;
                        }else{  
                             amountdue = Math.floor(money * paymoney * detailList * 100)/100; 
                             hbsy = 0.00;
                        }
                    }
                }
                $('.hbsy').html(hbsy); 
                $('#amountdue').html(changeDecimalBuZero(amountdue,2));
            });

        }else{
            $('#amountdue').html('0');
            $('#znone').show();
            $('.myselect').hide();
        }
    });
    //下拉框选择
    $(document).on('click','.select-list',function(){
        var self = this;
        var amountdue='';
        var paymoney = $('.paymoney').val()/100;
        var select_option=$(this).parents('.select').find('.select-option').attr('data-select');
        var detailList = $(this).parents('.mask').find('.detailListboxlist').html();
        var hbsy = $(this).parents('.mask').find('.hbsy');
        var hbsys = '';
        if(select_option == 2){
            var money = $('#investInput').val();
            var selecto = $('#selecto');
            if(selecto.attr("data-stype") == '投资红包'){
                 amountdue =  Math.floor((money *  paymoney * detailList + parseInt(selecto.attr("data-account"))) * 100)/100;
                 hbsys = Math.floor(selecto.attr("data-account") * 100) / 100;
            }else if(selecto.attr("data-stype") == '加息红包'){
                 amountdue = Math.floor(money * paymoney * (detailList * 1 + selecto.attr("data-apr")*1) * 100)/100;
                 hbsys = Math.floor(selecto.attr("data-apr")*money * paymoney * 100) / 100;
            }else{  
                 amountdue = Math.floor(money * paymoney * detailList * 100)/100;
                 hbsys = 0.00; 
            }
            $('#amountdue').html(changeDecimalBuZero(amountdue,2));
            hbsy.html(hbsys); 
        }else if(select_option == 1){
            var money = $('.transAmt').html();    
            var selecto = $('#selecto1');
            if(selecto.attr("data-stype") == '投资红包'){
                amountdue =  Math.floor((money *  paymoney * detailList + parseInt(selecto.attr("data-account"))) * 100)/100;
                hbsys = Math.floor(selecto.attr("data-account") * 100) / 100;     
            }else if(selecto.attr("data-stype") == '加息红包'){
                amountdue = Math.floor(money * paymoney * (detailList*1 + selecto.attr("data-apr")*1) * 100)/100;
                hbsys = Math.floor(selecto.attr("data-apr")*money * paymoney * 100) / 100;
            }else{  
                amountdue = Math.floor(money * paymoney * detailList * 100)/100;
                hbsys = 0.00; 
            }
            $('.yqsy').html(changeDecimalBuZero(amountdue,2));
            hbsy.html(hbsys);  
        }
    });
    //充值
    $(document).on('click','.recharge',function(){
        clickFn('recharge');
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
    var clientHeight = document.documentElement.clientHeight;
    var timer1 = null; 
    var isTop = true;
    //小圆圈显示隐藏
    $(window).on("scroll",function(){
        var osTop = document.documentElement.scrollTop || document.body.scrollTop;
        var clientHeight = document.documentElement.clientHeight;
        if(osTop > clientHeight){
            $('.ui-goTop').show();
        }else if(osTop < clientHeight){
            $('.ui-goTop').hide();
        }
        //主要用于判断当 点击回到顶部按钮后 滚动条在回滚过程中，若手动滚动滚动条，则清除定时器
        if(!isTop){
            clearInterval(timer1);
        }
        isTop = false;  
    });
    //点击小圆圈回到页面顶部
    $('.ui-goTop').on('click',function(){
        timer1 = setInterval(function(){
            //获取滚动条的滚动高度
            var osTop = document.documentElement.scrollTop || document.body.scrollTop;
            //用于设置速度差，产生缓动的效果
            var speed = Math.floor(-osTop / 6);
            // console.log(osTop,speed)
            document.documentElement.scrollTop = document.body.scrollTop = osTop + speed;
            isTop =true;  //用于阻止滚动事件清除定时器
            if(osTop == 0){
                clearInterval(timer1);
            }
        },20);
    });
    // 精准投资的详情点击
    $(document).on('click','.Axq',function(){
        $('.hytzxq04').html('');
        var borrow_nid = $(this).parents('.AccurateList_li').find('.loan_nid').val();
        var params = {
            borrow_nid : borrow_nid
        };
        if(G.isLogin){
            $('.max2').show().height(windowH);
            $(".maxyh").css("top",G.scrollTop + 50);
            G.post(Service.get_borrow_user_info,params,function(data){ 
                var itemHtml = Handlebars.compile(sbtable);
                $('.maxyh').html(itemHtml(data));
            }); 
        }else{
            G.$alert('请您先登录',false,function(){
                window.location.href = '/user/login?redirectURL='+encodeURIComponent(location.href);
                return false;
            });
        }
    });
    //散标立即购买
    var sbFun = function(){
        var transAmt = $('.transAmt').html();
        var loanNid = $('.nid').val();
        var productNid = $('.productNid').val();
        var hongbaoId = $('#selecto1').attr('data-id');
        var balance = $('.balance').val();
        var params3 = {
            'transAmt':transAmt, 
            'borrow_product_nid':productNid, 
            'loan_nid':loanNid,
            'hongbao_id':hongbaoId,
            'pay_pwd':$.md5($('#Bycombination').val())
        };
        $('#sbshop').addClass('btn-disable').attr("disabled","true");
        G.post(Service.bscg_tender_single, params3, function(data){
            if(data.returnCode=="1"){
                $('.mask').hide();
                var req_uuid=data.requestUrl;
                G.showLoading();
                getstatus(req_uuid);              
            }
            else{
                G.hideLoading();
                G.$alert(data.returnMsg,false,function(){
                    $('#mask').remove();
                    $('#zhbBtn').removeClass('btn-disable').removeAttr("disabled");
                },true);
            }           
        });    
    };
    function changeDecimalBuZero(number, bitNum) {  
           /// <summary>  
           /// 小数位不够，用0补足位数  
           /// </summary>  
           /// <param name="number">要处理的数字</param>  
           /// <param name="bitNum">生成的小数位数</param>  
           var f_x = parseFloat(number);  
           if (isNaN(f_x)) {  
               return 0;  
           }  
           var s_x = number.toString();  
           var pos_decimal = s_x.indexOf('.');  
           if (pos_decimal < 0) {  
               pos_decimal = s_x.length;  
               s_x += '.';  
           }  
           while (s_x.length <= pos_decimal + bitNum) {  
               s_x += '0';  
           }  
           return s_x;  
    }


    //状态刷新的接口
    var getstatus = function(req_uuid){
        G.post(Service.get_group_tender_status, {
            req_uuid:req_uuid
        }, function(data){ 
            if(data.returnCode == 1){
                G.hideLoading();
                G.$alert("投标成功!",true,function(){ 
                     window.location = location; 
                },true); 
            }else if(data.returnCode == 1111 || data.returnCode == 1112){
                timer2 = setTimeout(function() { 
                    time2++;
                    if(time2 <= 10){  
                        getstatus(req_uuid);
                    }else{
                        G.hideLoading();
                        G.$alert(data.returnMsg,false);
                        return false;
                    }
                },1000);
            }else{
                 G.hideLoading();
                 G.$alert(data.returnMsg,false);
                 return false;
            }
        });   
    };
});

