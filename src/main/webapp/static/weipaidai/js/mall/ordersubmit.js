define(function(require, exports, module) {

    var Handlebars = require('handlebars');
    var itemTpl = require('tpl/mall/addressList.tpl');
    require('mall/mallmeta');
    var itemStore = parseInt($("#itemStore").val());
    var init = function(){
        var amount = parseInt($('.sureinfo03p02').val());
        var price = parseInt($('.sureinfo02').html()); //所需微币数
        var total = amount * price;
        var hideAid = $("#hideAid").val();
        if(hideAid){
            var $thisLi = $('.addressz-li[data-id="'+hideAid+'"]');
            var address = $thisLi.find('.J_address').html();
            if(amount <= 1){
                $(".sureinfo03p01").addClass('disabled').siblings().removeClass('disabled');
            }else if(amount >=10 || amount>=itemStore){
                $(".sureinfo03p03").addClass('disabled').siblings().removeClass('disabled');
            }else{
                $(".sureinfo03 button").removeClass('disabled');
            }  
            $('.sureinfo04').html(total);
            $('.realPay-price').html(total);
            $thisLi.find(".addressz-radio").attr("checked",true);
            $thisLi.addClass("on").siblings().removeClass("on");     
            $('.sureresultd2_01').html(address);
        }     
    };
    //收货地址列表
    G.post(Service.addressList,{},function(data){
        // console.log(data);
        if(data.lists.length){
            var itemHtml = Handlebars.compile(itemTpl);        
            $.each(data.lists,function(key,item){
                item.replace_address = item.address_code.replace(/\//g," ");
            });        
            $("#addressList").html(itemHtml(data));
            init();
        }else{
            G.openIframe("新增地址","/iframe/addaddr",true);
        }   
    });
    //设置默认地址
    $(document).on("click",".set-default",function(){
        var aid = $(this).attr("data-id");
        G.post(Service.setDefAddress,{aid:aid},function(data){
            if(data.returnCode == "1"){
                window.location.reload();
            }else{
                G.toast(data.returnMsg,false);
            }
        });
    });
    //新增地址
    $(document).on('click',"#J_addaddr",function(){
        G.openIframe("新增地址","/iframe/addaddr");
    });
    //修改地址
    $(document).on('click',".J_upaddr",function(){
        var aid = $(this).attr("data-id");
        G.openIframe("修改地址","/iframe/addaddr?aid="+aid);
    }); 
    //点击地址栏 
    $(document).on("click",".addressz-li",function(){
        var address = $(this).find('.J_address').html();
        var aid = $(this).attr("data-id");
        $(this).find(".addressz-radio").attr("checked",true);
        $(this).addClass('on').siblings().removeClass('on');
        $("#itemAid").val(aid);
        $("#hideAid").val(aid);
        $('.sureresultd2_01').html(address);
    });
    //数量减号
    $('.sureinfo03p01').on('click', function() {
        var sureinfo03p02 = parseInt($('.sureinfo03p02').val()); //商品数量
        var sureinfo02 = parseInt($('.sureinfo02').html()); //所需微币数
        if (sureinfo03p02 <= 1) {
            $('.sureinfo03p01').addClass('disabled').siblings().removeClass('disabled');
            return false;
        } else {
            sureinfo03p02--;
            var total = sureinfo03p02 * sureinfo02;
            $('.sureinfo03p01').removeClass('disabled');
            $('.sureinfo03p03').removeClass('disabled');
            $('.sureinfo03p02').val(sureinfo03p02);
            $('.sureinfo04').html(total);
            $('.realPay-price').html(total);
            if (sureinfo03p02-- == 1) {
                $('.sureinfo03p01').addClass('disabled').siblings().removeClass('disabled');
            }
        }
    });
    //数量加号
    $('.sureinfo03p03').on('click', function() {
        var num = parseInt($('.sureinfo03p02').val()); //商品数量
        var price = parseInt($('.sureinfo02').html()); //所需微币数
        if(num >= itemStore){
            $(this).addClass('disabled').siblings().removeClass('disabled');
            G.toast("选择数量超过库存！");
            return false;
        } 
        if (num >= 10) {
            $(this).addClass('disabled').siblings().removeClass('disabled');
            G.toast("选择数量不能超过10件！");
            return false;
        } else {
            num++;
            var total = num * price;
            $('.sureinfo03p01').removeClass('disabled');
            $('.sureinfo03p03').removeClass('disabled');
            $('.sureinfo03p02').val(num);
            $('.sureinfo04').html(total);
            $('.realPay-price').html(total);
            if (num++ == 10) {
                $('.sureinfo03p03').addClass('disabled').siblings().removeClass('disabled');
            }
        }
    });
    //input数量改动
    $('.sureinfo03p02').on('change', function() {
        var reg = /^\d+$/;
        var sureinfo03p02 = $('.sureinfo03p02').val(); //商品数量
        var sureinfo02 = parseInt($('.sureinfo02').html()); //所需微币数
        var sureinfo04 = $('.sureinfo04').html(); //小计微币数
        var realPayprice = $('.realPay-price').html(); //实付微币
        if (!reg.test(sureinfo03p02)) {
            $('.sureinfo03p02').val("1");
            $('.sureinfo04').html(1 * sureinfo02);
            $('.realPay-price').html(1 * sureinfo02);
            $('#itemPrice').val(1 * sureinfo02);
            $('.sureinfo03p01').addClass('disabled').siblings().removeClass('disabled');
            return false;
        } else {
            if(parseInt(sureinfo03p02) >= itemStore){
                $('.sureinfo03p03').addClass('disabled').siblings().removeClass('disabled');
                if(itemStore > 10){
                    var itemCount = 10;
                }else{
                    var itemCount = itemStore;
                }
                $(this).val(itemCount); 
                $('.sureinfo04').html(itemCount * sureinfo02);
                $('.realPay-price').html(itemCount * sureinfo02);
                G.toast("选择数量超过库存！");
                return false;
            } 
            if (parseInt(sureinfo03p02) > 10) {
                alert('你好,商品的选择数量最高为10件!');
                sureinfo03p02 = 10;
                $('.sureinfo03p03').addClass('disabled').siblings().removeClass('disabled');
                $('.sureinfo03p02').val(sureinfo03p02);
                $('.sureinfo04').html(sureinfo03p02 * sureinfo02);
                $('.realPay-price').html(sureinfo03p02 * sureinfo02);
                return false;
            } else if (parseInt(sureinfo03p02) < 1) {
                alert('你好,商品的选择数量最低为1件！');
                sureinfo03p02 = 1;
                $('.sureinfo03p01').addClass('disabled').siblings().removeClass('disabled');
                $('.sureinfo03p02').val(sureinfo03p02);
                $('.sureinfo04').html(sureinfo03p02 * sureinfo02);
                $('.realPay-price').html(sureinfo03p02 * sureinfo02);
                return false;
            } else if (parseInt(sureinfo03p02) == 1) {
                $('.sureinfo03p01').addClass('disabled').siblings().removeClass('disabled');
                $('.sureinfo04').html(sureinfo03p02 * sureinfo02);
                $('.realPay-price').html(sureinfo03p02 * sureinfo02);
            } else if (parseInt(sureinfo03p02) == 10) {
                $('.sureinfo03p03').addClass('disabled').siblings().removeClass('disabled');
                $('.sureinfo04').html(sureinfo03p02 * sureinfo02);
                $('.realPay-price').html(sureinfo03p02 * sureinfo02);
            } else {
                $('.sureinfo03p01').removeClass('disabled');
                $('.sureinfo03p03').removeClass('disabled');
                $('.sureinfo03p02').val(sureinfo03p02);
                $('.sureinfo04').html(sureinfo03p02 * sureinfo02);
                $('.realPay-price').html(sureinfo03p02 * sureinfo02);
            }
        }
    });
});