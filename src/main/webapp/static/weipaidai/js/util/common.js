/*
 * @Author: lhywork 
 * @Date: 2018-07-12 15:43:37 
 * @Last Modified by:   lhywork@aliyun.com 
 * @Last Modified time: 2018-07-12 15:43:37 
 */

var DomainURL = location.origin ? window.location.origin:(location.protocol + "//" + location.host);

var debug = false;

var util = {
    isLogin: false,
    UserInfo: webAppInfo,
    scrollTop: 0,
    BaseURL: debug ? '//192.168.1.113:8080' : '//192.168.1.217:9240',
    redisURL:'//192.168.1.217:9220',
    msgURL:'//192.168.1.217:9200',
    imagesURl:'//static.server.net'
};
var ECODE = {
    'E0001':'\u7528\u6237\u767b\u5f55\u8bb0\u5f55\u4e0d\u5b58\u5728',
    'E0002':'\u7528\u6237\u767b\u5f55\u72b6\u6001\u8ba4\u8bc1\u5931\u8d25',
    'E0003':'\u767b\u5f55\u8d85\u65f6\u6216\u5df2\u5728\u522b\u5904\u767b\u5f55\u002c\u8bf7\u91cd\u65b0\u767b\u5f55',
    'E0004':'\u7f51\u7edc\u7e41\u5fd9\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5\u0020\u007e\u007e',
    'E0005':'\u9000\u51fa\u767b\u5f55\u5931\u8d25\uff01'
};
var Service = {
    logout:'/api/logout',
    //发送验证码
    sendText:util.msgURL+'/message/sendText',
    //验证手机号码
    checkUsername:util.BaseURL +'/wpd/user/checkUsername',
    //获取最新动态
    dynamicList: util.BaseURL + '/wpd/index/get_last_dynamic',
    //获取最新公告
    noticeList: util.BaseURL + '/wpd/index/get_last_notice',
    //获取媒体报道
    getAllMedia:util.BaseURL + '/wpd/index/get_all_media',
    //获取最新动态和公告的详细数据
    getSiteResult: util.BaseURL + '/wpd/index/get_site_result',
    //获取资质证书列表
    getAllCredentials: util.BaseURL + '/wpd/index/get_all_credentials',
    //获取借款产品列表
    borrowList: util.BaseURL + '/wpd/index/borrow/loan_List',
    //投资产品列表
    productborrowlist:util.BaseURL + '/wpd/index/borrow/product_borrow_list',
    //获取投资产品的投资人数列表
    getproductList:util.BaseURL + '/wpd/index/borrow/product_borrow_tender_list',

    Usermain:util.BaseURL +'/wpd/user_query/user_main',

    shouyis:util.BaseURL +'/wpd/user_query/user_shouyis',

    UserDisplay:util.BaseURL +'/wpd/user/user_display_click',
    //交易记录列表
    recordList:util.BaseURL +'/wpd/user_query/user_capital_record',
    //还款记录列表
    getFinishedRepayList:util.BaseURL +'/wpd/user_query/getFinishedRepayList',
    //我的投资列表
    myinvestList:util.BaseURL + '/wpd/user_query/get_borrow_tender_record',
    //我的投资明细列表
    myloanList:util.BaseURL + '/wpd/user_query/get_borrow_shut_loan_list',
    //历史债权列表
    hisrecordList:util.BaseURL + '/wpd/user_query/get_his_borrow_tender_record',
    //修改登录密码
    userModifyPwd:util.redisURL + '/reg/userModifyPwd',
    //忘记密码
    userBackPwd:util.redisURL + '/reg/userBackPwd',
    //获取用户红包
    hongbaolist:util.BaseURL + '/wpd/user_query/hongbaolist',
    //获取用户红包收益
    package_profit:util.BaseURL + '/wpd/user_query/get_user_red_package_profit',
    //使用现金红包
    useHongbao:util.BaseURL + '/wpd/user_query/use_money_hongbao',
    //消息列表
    messageList:util.BaseURL + '/wpd/user_query/get_user_message_list',
    //用户已读所有消息
    readallMessage:util.redisURL + '/user/read_all_message',
    //用户已读单条消息操作
    read_one_message:util.redisURL + '/user/read_one_message',
    //充值
    recharge:util.BaseURL + '/wpd/user/bscg_user_recharge',
    //包商存管账户
    admininfo:util.BaseURL + '/wpd/user_query/get_bscg_admin_info',
    //获取用户提现的相关信息
    get_cash_refresh_data:util.BaseURL + '/wpd/user_query/get_cash_refresh_data',
    //提现
    bscg_user_cash:util.BaseURL + '/wpd/user/bscg_user_cash',
    //查询存管账户操作结果
    bscgResult:util.BaseURL + '/wpd/user_query/get_bscg_hanlder_result',
    //修改包商账户交易密码
    modify_bscg_pwd:util.BaseURL + '/wpd/user/modify_bscg_pwd',
    //解绑包商账户银行卡
    bscg_unbind_bank_card:util.BaseURL + '/wpd/user/bscg_unbind_bank_card',
    //重新绑定包商账户银行卡
    bscg_bind_bank_card:util.BaseURL + '/wpd/user/bscg_bind_bank_card',
    //验证手机号码
    verifyRandCode:util.BaseURL + '/wpd/user/verifyRandCode',
    //好友投资记录列表
    get_friend_loan_list:util.BaseURL + '/wpd/user_query/get_friend_loan_list',
    //好友邀请列表
    get_friend_list:util.BaseURL + '/wpd/user_query/get_friend_list',
    //获取投资产品详情
    product_borrow_detail_list:util.BaseURL + '/wpd/index/borrow/product_borrow_detail_list',
    //获取投资产品借款标的列表
    product_borrow_nid_list:util.BaseURL + '/wpd/index/borrow/product_borrow_nid_list',
    //购买组合标
    bscg_tender_group:util.BaseURL + '/wpd/user/bscg_tender_group',
    //购买散标
    bscg_tender_single:util.BaseURL + '/wpd/user/bscg_tender_single',
    //获取借款标的借款人信息
    get_borrow_user_info:util.BaseURL + '/wpd/user_query/get_borrow_user_info',
    //获取用户可用余额数据
    get_balance:util.BaseURL + '/wpd/user_query/get_balance',
    //获取网站披露信息数据接口
    getStaticWebDataInfo:util.redisURL +'/wpd/data/getDynamicWebDataInfo',
    //获取散标投资的额交易记录
    borrow_tender_list:util.BaseURL + '/wpd/index/borrow/borrow_tender_list',
    //购买组合标子标
    bscg_tender_child:util.BaseURL + '/wpd/user/bscg_tender_child',
    //获取用户实名信息
    realnameinfo: '/api/getUsRealnameInfo',
    //用户中心-任务是否可领取信息（可调试）
    rewardList:util.msgURL + '/rewardList',
    //用户中心-常规奖励领取（升级，注册，用户实名）
    getReward:util.msgURL + '/getReward',
    //获取存管操作状态投标状态
    get_biz_status:util.BaseURL+'/wpd/user_query/get_biz_status',
    //获取授权的接口
    authorityAubuam:util.redisURL + '/user/authorityAubuam',
    //用户授权的接口
    authority:util.redisURL + '/user/authority',
    //获取用户历史金额
    get_old_account:util.BaseURL+'/wpd/user_query/get_old_account',
    //到期回款列表
    oldtenderlist:util.BaseURL+'/wpd/user_query/oldtenderlist',
    //用户历史债权提现记录
    oldredeemlist:util.BaseURL+'/wpd/user_query/oldredeemlist',
    //用户赎回历史债权
    use_old_tender:util.BaseURL+'/wpd/user/use_old_tender',
    //获取存管操作状态投标状态
    get_group_tender_status:util.BaseURL+'/wpd/user_query/get_group_tender_status',
    //刷新用户资金
    refreshAccout:util.BaseURL+'/wpd/user_query/refreshAccout',
    //添加地址
    addAddress:util.redisURL+'/user/we_mall/addAddress',
    //修改地址
    updateAddress:util.redisURL+'/user/we_mall/updateAddress',
    //地址列表
    addressList:util.redisURL+'/user/we_mall/addressList',
    //设置默认地址
    setDefAddress:util.redisURL+'/user/we_mall/setDefaultAddr',
    //单个地址信息获取
    addressInfo:util.redisURL+'/user/we_mall/addressInfo',
    //删除地址
    delAddress:util.redisURL+'/user/we_mall/delAddress',
    //红包列表
    bonusList:util.redisURL+'/user/we_mall/bonusList',
    //订单列表
    orderList:util.redisURL+'/user/we_mall/orderList',
    //订单详情
    orderDetail:util.redisURL+'/user/we_mall/orderDetail',
    //提交订单
    subOrder:util.redisURL+'/user/we_mall/subOrder_web',
    //红包兑换
    bonusExc:util.redisURL+'/user/we_mall/bonusExc',
    //微币记录
    cList:util.redisURL+'/user/we_mall/cList',
    //搜索初始化
    searchInit:util.redisURL+'/user/we_mall/searchInit',
    //搜索结果
    searchProduct:util.redisURL+'/user/we_mall/searchProduct',
    //商品更多
    productsMore:util.redisURL+'/user/we_mall/productsMore',
    //快捷充值
    rechargefast:util.BaseURL+'/wpd/user/bscg_user_recharge_fast',
    //修改交易密码
    userModifyPayPwd:util.redisURL+'/reg/userModifyPayPwd',
    //借款申请
    loanApply:util.BaseURL+'/wpd/user/add_loan_apply_info',
    //获取富友地市列表
    areaList:util.BaseURL+'/wpd/index/get_fy_area_list'
};

/**
  * AJAX get请求
  * @param  {[type]} url     url地址
  * @param  {[type]} data    data参数
  * @param  {[type]} success 成功回调
  * @param  {[type]} error   失败回调
  * @return {[type]}         [description]
  */
util.get = function (url, data, success, error) {
    if (typeof(data) == "object") {           
        data.uuid = CSRFTOKEN;
        data.us_token = webAppInfo.us_token;
        data.user_id = webAppInfo.user_id;          
    }  
    $.ajax({ 
        url: url, 
        type: "GET", 
        data: data,
        timeout: 10000,
        dataType: "json",             
        success: function (data,status,xhr) {
            if(data && typeof(data.us_token_msg) !== "undefined"){
                var ustokenMsg = data.us_token_msg;
                if(ustokenMsg.indexOf(ECODE.E0001)>-1 || ustokenMsg.indexOf(ECODE.E0002)>-1){
                    util.isLogin = false;
                    $(".mask").remove();
                    util.$alert(ECODE.E0003,false,function(){
                        util.Logout();
                    },true);
                }
            }                
            if(success) {
                success(data,status,xhr);
            }
        },
        error: function (data,status) {
            util.hideLoading();
            if(status == 'timeout'){             
                util.toast(ECODE.E0004);
            }else{
                util.toast(ECODE.E0004);
            }
            if (error) {
                error(data);
            }
        }
    });
};
/**
  * AJAX post请求
  * @param  {[type]} url     url地址
  * @param  {[type]} data    data参数
  * @param  {[type]} success 成功回调
  * @param  {[type]} error   失败回调
  * @return {[type]}         [description]
  */
util.post = function (url, data, success, error) {      
    if (typeof(data) == "object") {           
        data.uuid = CSRFTOKEN;
        data.us_token = webAppInfo.us_token;
        data.user_id = webAppInfo.user_id;          
    } 
    $.ajax({ 
        url: url,
        type: "post",
        data: data,
        timeout: 10000, 
        dataType: "json",           
        success: function (data,status,xhr) {
            if(data && typeof(data.us_token_msg) !== "undefined"){
                var ustokenMsg = data.us_token_msg;
                if(ustokenMsg.indexOf(ECODE.E0001)>-1 || ustokenMsg.indexOf(ECODE.E0002)>-1){
                    util.isLogin = false;
                    $(".mask").remove();
                    util.$alert(ECODE.E0003,false,function(){
                        util.Logout(); 
                    },true);
                }
            }
            if(success) {
                success(data,status,xhr);
            }
        },
        error: function (data,status) {
            util.hideLoading();
            if(status == 'timeout'){
                util.toast(ECODE.E0004);
            }else{
                util.toast(ECODE.E0004);
            }
            if (error) {
                error(data);
            }
        }
    });
};
/**
 * App 初始化调用
 * @param  {[type]} App [description]
 * @return {[type]}     [description]
 */
util.onReady = function(App){
    if(App && (typeof(App)==="object")){
        App.init();
    }else{
        console.info("App isn't object");
    }
};
/**
 * 月份不足补0
 * @param {[type]} number [description]
 */
util.Appendzero = function (number) {  
    if(number<10) return "0" + "" + number;  
    else return number;  
};

/**
 * 检测对象是否是空对象(不包含任何可读属性)。
 * 方法既检测对象本身的属性，也检测从原型继承的属性(因此没有使hasOwnProperty)。
 */
util.isEmpty = function(obj) {  
    for (var name in obj) {
        return false;
    }
    return true; 
}; 
/**
 * 用户登录
 **/
util.Login = function() {
    var data = webAppInfo;
    // console.log(data);
    if(util.isEmpty(data) || typeof(data.us_token_msg) == "undefined"){
        util.toast(ECODE.E0004);
        return false;
    }
    if(data.us_token_msg.indexOf(ECODE.E0002)>-1){
        util.isLogin = false;
        $(".mask").remove();
        util.$alert(ECODE.E0003,false,function(){
            util.Logout(); 
        },true);
    }
    if(data.user_name){
        util.isLogin = true;
    }
};
/**
 * 返回登录页
 * @return {[type]} [description]
 */
util.goLogin = function(){
    window.location = "/user/login?redirectURL="+encodeURIComponent(location.href);
};
/**
 * 退出登录
 * @return {[type]} [description]
 */
util.Logout = function(){
    util.post(Service.logout,{},function(data){
        util.goLogin();
    });
};  
/**
 * 进度条加载
 */
util.progress = function () {
    var opts = {
        top: $(window).scrollTop(),
        bottom: $(window).scrollTop() + $(window).height()
    };
    $(".progress").each(function(i,item){
        if (opts.top <= $(this).offset().top && opts.bottom >= $(this).offset().top && !$(this).data('bPlay')) {
            $(this).data('bPlay', true);
            var progress = $(this).attr("data-width");
            $(item).animate({width: progress},1000);
        }
    });
};
/**
 * 身份证验证
 * @param {String} card
 */
util.isCardNo = function(card){  
    // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X  
    var reg = /^[1-9][0-9]{5}(19[0-9]{2}|200[0-9]|2010)(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])[0-9]{3}[0-9xX]$/i;   
    return  reg.test(card);  
};
util.showLoading = function(){
    var winBox = $('<div class="loading-mask"><div class="loading" ></div></div>');
    winBox.appendTo("body");    
};
util.hideLoading = function(){
    $(".loading-mask").remove();
};
util.openIframe = function(title,url,colse,callback){
    var option = {
        title: title||"修改地址",
        url: url || "/iframe/addaddr",
        colse: colse ? 'hide':'' 
    };
    var winBox = $(
        '<div class="tc-mask"></div>' + 
        '<div class="tc-popup add-addr">' + 
        '<h2 class="tc-popup-title">' + option.title + '</h2>'+
        '<a href="javascript:void(0);" title="关闭" class="tc-popup-close '+option.colse+'"></a>' + 
        ' <div class="tc-popup-content">' + 
        '<iframe frameborder="0" border="0" scrolling="no" class="add-addr-iframe" src="'+option.url+'"></iframe>' +
        '</div></div>');
    winBox.appendTo("body");
    $(document).on('click','.tc-popup-close',function(){
        if(callback){
            callback();
        }else{
            $(".tc-mask,.tc-popup").remove();
        }
    });
};
/**
 * $alert弹窗
 * @param  {[type]}    msg      提示消息
 * @param  {[boolean]} icon     true/false
 * @param  {Function}  callback 点击回调
 * @param  {[boolean]} close    关闭回调
 * @param  {[type]}    title    标题文字
 * @return {[type]}             [description]
 */
util.$alert = function(msg,icon,callback,close,title){
    var option = {
        msg: msg||'提示信息',
        title: title||'信息提示',
        icon: (typeof(icon) == 'undefined') ? 'true':(icon+'')
    };
    var winBox = $(
        '<div class="mask" id="mask">' + 
        '<div class="pop" id="J_alert_box">' + 
        '<h3  class="pop-title">' + option.title + '<span class="pop-close" id="pop_box_close"></span></h3>' + 
        '<div class="pop-main pop-tips"> <h3 class="pop-tips-center">' + option.msg + ' </h3>' + 
        '<em class="icon-' + option.icon + '"></em><input type="button" class="next-step mt-40" value="确定" id="pop_box_sure"/></div>' +
        '</div></div>');
    winBox.appendTo("body");
    $(document).on('click','#pop_box_sure',function(){
        if(callback){
            callback();
        }else{
            $("#mask").remove();
        }
    });
    $(document).on('click','.pop-close',function(){
        if(callback && close){
            callback();
        }else{
            $("#mask").remove();
        }
    });
};
/**
 * 获取cookie信息
 * @param  {[type]} e [description]
 * @return {[type]}   [description]
 */
util.getCookie = function(cname) {
    var name = cname + "=";  
    var ca = document.cookie.split(';');  
    for(var i=0; i<ca.length; i++) {  
        var c = ca[i];  
        while (c.charAt(0)==' ') c = c.substring(1);  
        if (c.indexOf(name) != -1) return c.substring(name.length, c.length);  
    }  
    return "";  
};
/**
 * toast提示
 * @param {String} msg
 * @param {String} time
 */
util.toast = function(msg,time){
    var t = time || 2000;
    if($('.util-toast').length >= 1){
        return false;
    }
    $('body').append('<div class="util-toast">' + msg + '</div>');
    var marginLeft = -$(".util-toast").width()/2;
    $(".util-toast").css("margin-left",marginLeft);
    setTimeout(function() {$('.util-toast').remove();}, t);
};
/**
 * 获取url参数
 * @param  {String} name 参数值
 * @return {Boolean}      [description]
 */
util.getUrlparam = function(name) {

    var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
    var r = window.location.search.substr(1).match(reg);
    if (r !== null) {
        return unescape(r[2]);
    }
    return null;
};
/**
 * 格式化时间戳
 * @param  {[type]} time [description]
 * @param  {[type]} fmt  [description]
 * @return {[type]}      [description]
 */
util.formatTime=function(time,fmt){
    var timeObj=new Date(time);
    var o = {
        "M+" : timeObj.getMonth()+1,                 //月份
        "d+" : timeObj.getDate(),                    //日
        "h+" : timeObj.getHours(),                   //小时
        "m+" : timeObj.getMinutes(),                 //分
        "s+" : timeObj.getSeconds(),                 //秒
        "q+" : Math.floor((timeObj.getMonth()+3)/3), //季度
        "S"  : timeObj.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt))
        fmt=fmt.replace(RegExp.$1, (timeObj.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
        if(new RegExp("("+ k +")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
    return fmt;
};

util.formatDate = function(timestamp){
    var time = new Date(timestamp);
    var y = time.getFullYear();
    var m = time.getMonth()+1;
    var d = time.getDate();
    var h = time.getHours();
    var mm = time.getMinutes();
    var s = time.getSeconds();
    var add0 = function (m){
        return m<10?'0'+m:m; 
    };
    return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
};
/**
 * 发送短信验证码
 * @param {[type]} code [description]
 * 
 */
util.sendSms = function (code) {
    var sendnums = 120;
    var sendtimer = null; 
    function ms(){
        if (sendnums === 0) {
            code.removeClass('gray-bg').removeAttr("disabled").html("获取验证码");    
            sendnums = 120;
            clearTimeout(sendtimer);
            return false;
        } else {
            code.addClass('gray-bg').attr("disabled","true").html(sendnums + "秒后重新发送");
            sendnums--;    
        }
        sendtimer = setTimeout(function () {
            ms();
        }, 1000);
    }
    ms();
};
/**
 * sendText
 * @param  {[type]} params  [description]
 * @param  {[type]} code    [description]
 * @return {[type]}         [description]
 */
util.sendText = function(params,code){
    code.html('短信发送中..');  
    util.post(Service.sendText, params, function(data){
        if(data.result == 1){
            util.sendSms(code);
        }else{
            code.removeClass('gray-bg').removeAttr("disabled");
            alert(data.message);
        }                               
    });
};
/**
 * 获取终端类型
 * @type {Object}
 */
util.browser = {
    versions: function() {
        var u = navigator.userAgent,
            app = navigator.appVersion;
        return { //移动终端浏览器版本信息
            trident: u.indexOf('Trident') > -1, //IE内核
            presto: u.indexOf('Presto') > -1, //opera内核
            webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
            gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
            mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
            ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
            android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器
            iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
            iPad: u.indexOf('iPad') > -1, //是否iPad
            webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
        };
    }(),
    language: (navigator.browserLanguage || navigator.language).toLowerCase()
};
$.fn.template = function(itemTpl,data){
    var obj = this;
    if(typeof Handlebars == "undefined"){
        return false;
    }
    return(function (){
        var itemHtml = Handlebars.compile(itemTpl);
        $(obj).html(itemHtml(data));
    })();  
};
window.webApp = window.G = util;
$(document).ready(function(){
    util.Login();
    //// 置顶
    var HFlag = true;
    window.onload = window.onscroll = function() {
        var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
        var $J_header = document.getElementById('J_header_main');
        if(!$J_header){return false;}
        util.scrollTop = scrollTop;
        if (scrollTop > 34) {
            if(HFlag){
                $J_header.style.position = "fixed";
                HFlag = false;
            }      
        } else {
            $J_header.style.position = "relative";
            HFlag = true;
        }       
    };
    $(document).on('click','.checkedBtn',function(){
        $(this).toggleClass('on');
        if($(this).hasClass("on")){
            $('.checked-button').addClass('btn-disable').attr("disabled","true");
        }else{
            $('.checked-button').removeClass('btn-disable').removeAttr("disabled");
        }     
    });   
});


