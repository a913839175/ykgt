define(function(require, exports, module){
    var jsencrpt = require('JSEncrypt');
    var lazyload = require('lazyload');
    var pagination = require('pagination');
    var Handlebars = require('handlebars');
    var itemTpl = require('tpl/mall/dhrecord.tpl');
    require('mall/mallmeta');
    var App = function() {
        var bindFlag = true;
        var postData = {
            user_id:webAppInfo.user_id,
            page:1,
            epage:4
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
                G.post(Service.orderList,params,function(data){
                    $("#recordList").template(itemTpl,data);
                    $("img").lazyload(); 
                    if(bindFlag){
                        $('.M-box').pagination({
                            totalData:data.total,
                            showData:4,
                            coping:true,
                            callback:function(api){
                                bindFlag = false;
                                //再次渲染列表
                                postData.page = api.getCurrent();
                                App.renderData(postData);
                            }
                        });
                    }               
                });
            }       
        };
    }();
    G.onReady(App); 
});