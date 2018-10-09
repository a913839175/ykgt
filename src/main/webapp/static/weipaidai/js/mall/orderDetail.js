define(function(require, exports, module){
    var jsencrpt = require('JSEncrypt');
    require('mall/mallmeta');
    var App = function() {
        var orderId = $("#orderId").val();
        var postData = {
            user_id:webAppInfo.user_id,
            order_id:orderId,
        };
        var encodeStr = function(STR, TOKEN) {
            return JSEncrypt(STR, PAGENAME, TOKEN, PAGEWEB);
        };
        return {
            /**
             * 初始化入口
             * 
             */
            init: function() {                       
                App.renderData(postData);
            },
            renderData:function(postData){
                var subtime = new Date().getTime()+"";
                var params = {
                    userVerify: encodeStr(JSON.stringify(postData), subtime),
                    unixkey: subtime
                };
                G.post(Service.orderDetail,params,function(data){});
            }       
        };
    }();
    G.onReady(App); 
});