define(function(require, exports, module){
    var pagination = require('pagination');
    var Handlebars = require('handlebars');
    var itemTpl = require('tpl/newsList.tpl');
    var bindFlag = true;
    var params = {
        epage:10,
        page:1
    }
    var App = function(){
        return {
            /**
             * 初始化入口
             * 
             */
            init:function(){
                App.renderData(0,params);
                App.bindEvent();
            },
            renderData:function(index,params){
                var apiUrl = index ? Service.noticeList : Service.dynamicList;
                G.get(apiUrl,params,function(data){    
                    $(".newsList").template(itemTpl,data);
                    if(bindFlag){
                        $('.M-box').pagination({
                            totalData:data.total,
                            showData:8,
                            coping:true,
                            callback:function(api){
                                bindFlag = false;
                                //再次渲染列表
                                params.page = api.getCurrent();
                                App.renderData(index,params);
                            }
                        });
                    }               
                });
            },
            bindEvent:function(){
                $('.news-tab-a').on('click',function(){
                    var index = $(this).index();
                    $(this).addClass('on').siblings().removeClass('on');
                    bindFlag = true;
                    params.page = 1;
                    App.renderData(index,params);
                });
            }
        }
    }();
    G.onReady(App);
});