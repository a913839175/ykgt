define(function(require, exports, module){
    var flexslider = require("flexslider");
    var select = require('select');
    require('mall/mallmeta');
    var Handlebars = require('handlebars');
    var itemTpl = require('tpl/mall/productinfo.tpl');
    var itemTplss = require('tpl/mall/productinfoss.tpl');
    var lazyload = require('lazyload');
    //判断是搜索还是更多所需要展示的产品
    var render = function(){
        var gdid=$('#gdid').val();
        var address=window.location.href;
        var arr=[];
        var newaddress = "";
        if(address.indexOf("sousuo") > -1){
            arr.push(address.split('='));
            newaddress = decodeURI(arr[0][1]);
            G.post(Service.searchProduct,{keywords:newaddress},function(data){
                var itemTpl = Handlebars.compile(itemTplss);
                $(".infotitlez").html(itemTpl(data));
                $("img.lazy").lazyload(); 
            });
        }else{
            G.post(Service.productsMore,{categoryId:gdid,productCount:"50",page:1,epage:50},function(data){
                var itemHtml = Handlebars.compile(itemTpl);
                $(".infotitlez").html(itemHtml(data));
                $("img.lazy").lazyload(); 
            });
        }
    };
    render();
    $("img.lazy").lazyload();
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

});