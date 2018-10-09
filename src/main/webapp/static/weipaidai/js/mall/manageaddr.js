define(function(require, exports, module){
    var Validform = require('Validform');
    var Handlebars = require('handlebars');
    var itemTpl = require('tpl/mall/addressTable.tpl');
    var $citypicker = $('#city-picker');
    require('mall/mallmeta');
    require.async("citypicker",function(){
        var citydata = require("citydata");
        var aid = G.getUrlparam("aid");
        if(!aid){       
            $citypicker.citypicker();
        }       
    });
    var App = function() {
        var aid = G.getUrlparam("aid");
        return {
            /**
             * 初始化入口
             * 
             */
            init: function() {               
                App.bindEvent();
                App.rendrData();
                if(aid){
                    App.addressInfo();  
                }       
            },
            rendrData:function(){
                //收货地址列表
                G.post(Service.addressList,{},function(data){
                    var itemHtml = Handlebars.compile(itemTpl);
                    $.each(data.lists,function(key,item){
                        item.province = item.address_code.split("/")[0];
                        item.city = item.address_code.split("/")[1] || "";
                        item.area = item.address_code.split("/")[2] || "";
                    });
                    $("#addressTable").html(itemHtml(data));
                });
            },
            addressInfo:function(){
                G.post(Service.addressInfo,{aid:aid},function(data){
                    if(data.returnCode == "1"){
                        data.province = data.address_code.split("/")[0];
                        data.city = data.address_code.split("/")[1] || "";
                        data.area = data.address_code.split("/")[2] || "";
                        $(".item-textarea").val(data.detailed_address);
                        $("#J_FormPostal").val(data.postal_code);
                        $("#J_FormshName").val(data.consignee);
                        $("#J_FormPhone").val(data.con_phone);
                        $citypicker.citypicker({
                            province: data.province,
                            city: data.city,
                            district: data.area
                        });           
                    }
                });                    
            },
            addAddress:function(){
                var consignee = $("#J_FormshName").val();
                var address_code = $("#city-picker").val();
                var detailed_address = $(".item-textarea").val();
                var postal_code = $("#J_FormPostal").val();
                var con_phone = $("#J_FormPhone").val();
                var normal_phone = $(".item-area").val()+"-"+$(".item-dphone").val()+"-"+$(".item-fephone").val();
                var address_status = $(".i-chk").is(":checked") ? "1":"0";
                var params = {
                    consignee:consignee,
                    address_code:address_code,
                    detailed_address:detailed_address,
                    postal_code:postal_code,
                    con_phone:con_phone,
                    normal_phone:normal_phone,
                    address_status:address_status,
                    user_id:webAppInfo.user_id||"",
                    aid:aid||""
                };
                var apiUrl = aid ? Service.updateAddress : Service.addAddress;
                G.post(Service.addAddress,params,function(data){
                    if(data.returnCode == "1"){
                        window.top.location.reload();
                    }else{
                        G.toast(data.returnMsg,false);
                    }
                });
            },
            bindEvent: function(){
                //新增地址
                var addAddress = $('.form-box').Validform({
                    btnSubmit: "#Addrsave",
                    tiptype: 2,
                    beforeSubmit: function(curform) {
                        App.addAddress();                  
                    }
                });
                //修改地址
                $(document).on("click","#J_updataAddr",function(data){
                    var aid = $(this).attr("data-id");
                    G.openIframe("修改地址","/iframe/addaddr?aid="+aid);
                });
                //删除地址
                $(document).on("click","#J_delAddress",function(data){
                    var aid = $(this).attr("data-id");
                    G.post(Service.delAddress,{aid:aid},function(data){
                        if(data.returnCode == "1"){
                            App.rendrData();
                        }else{
                            G.toast(data.returnMsg,false);
                        }
                    });
                });
                //设置默认地址
                $(document).on("click","#J_setdefault",function(){
                    var aid = $(this).attr("data-id");
                    G.post(Service.setDefAddress,{aid:aid},function(data){
                        if(data.returnCode == "1"){
                            window.location.reload();
                        }else{
                            G.toast(data.returnMsg,false);
                        }
                    });
                });
            }   
        };
    }();
    G.onReady(App);    
});