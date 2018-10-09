define(function(require, exports, module){
    var App = function(){
        return {
            /**
             * 初始化入口
             * 
             */
            init:function(){
                App.renderData();
            },
            renderData:function(){

            }
        };
    }();
    G.onReady(App);
});