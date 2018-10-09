define(function(require, exports, module){
    var Validform = require('Validform');
    var lazyload = require('lazyload');
    require('mall/mallmeta');
    var App = function() {
        var itemStore = parseInt($("#itemStore").val());
        var currency = parseInt($("#currency").html());
        var price = parseInt($("#itemPrice").val());
        return {
            /**
             * 初始化入口
             * 
             */
            init: function() {
                $('.amount-input').val('1'); 
                $("img").lazyload();                           
                App.bindEvent();       
            },
            bindEvent:function(){                
                // 数量累加
                $('.amount-increase').on('click',function(){
                    var num = parseInt($('.amount-input').val());
                    num++;
                    $(this).siblings().removeClass('disabled');
                    if(num >= itemStore){
                        $(this).addClass('disabled').siblings().removeClass('disabled');
                        $('.amount-input').val(itemStore);
                        G.toast("选择数量超过库存！");
                        return false;
                    }                          
                    if(num >= 10){
                        $(this).addClass('disabled').siblings().removeClass('disabled');
                        $('.amount-input').val(10);
                        G.toast("选择数量不能超过10件！");     
                        return false;
                    } 
                    $('.amount-input').val(num);                        
                });
                //数量累减
                $('.amount-decrease').on('click',function(){
                    var num = parseInt($('.amount-input').val());
                    num--;
                    if(num <= 1){
                        $(this).addClass('disabled').siblings().removeClass('disabled');
                        $('.amount-input').val(1);
                        return false;
                    }else{
                        $(this).siblings().removeClass('disabled');
                    }
                    $('.amount-input').val(num);
                });
                //数量change
                $('.amount-input').on('change', function() {
                    var num = $('.amount-input').val();
                    var reg = /^\d+$/;
                    if (!reg.test(num)) {
                        $(this).val("1");
                        $('.amount-decrease').addClass('disabled').siblings().removeClass('disabled');
                        return false;
                    }else{
                        num = parseInt(num);
                        if(num >= itemStore){
                            $(".amount-increase").addClass('disabled').siblings().removeClass('disabled');
                            if(itemStore > 10){
                                $(this).val(10);
                            }else{
                                $(this).val(itemStore); 
                            }                         
                            G.toast("选择数量超过库存！");
                            return false;
                        }else if(num >= 10){
                            $(".amount-increase").addClass('disabled').siblings().removeClass('disabled');
                            $(this).val(10);
                            G.toast("选择数量不能超过10件！");     
                            return false;
                        }else if(num <=1){
                            $(".amount-decrease").addClass('disabled').siblings().removeClass('disabled');
                            $(this).val(1);     
                            return false;
                        }else{
                            $(this).val(num);
                        } 
                    }
                });
                var itemForm = $('#itemForm').Validform({
                    btnSubmit: "#J_LinkBuy",
                    tiptype: 3,
                    beforeSubmit: function(curform) {                    
                        var amount = parseInt($(".amount-input").val());
                        var total = amount * price; 
                        if(currency < total){
                            G.$alert("您的微币余额不足！",false,function(){
                                window.location.reload();
                            },true);
                           return false; 
                        }                     
                    }
                });
            }
        };
    }();
    G.onReady(App);   
});