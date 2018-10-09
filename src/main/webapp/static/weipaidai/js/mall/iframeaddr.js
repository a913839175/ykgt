define(function(require, exports, module){
    var Validform = require('Validform');
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
                if(aid){
                    App.addressInfo();  
                }       
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
                        $(".item-area").val(data.normal_phone.split("-")[0]||"");
                        $(".item-dphone").val(data.normal_phone.split("-")[1]||"");
                        $(".item-fephone").val(data.normal_phone.split("-")[2]||"");
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
                var normal_phone = "";
                if($(".item-area").val()){
                    normal_phone = $(".item-area").val()+"-"+$(".item-dphone").val()+"-"+$(".item-fephone").val();
                }else{
                    normal_phone = "";
                }        
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
                G.post(apiUrl,params,function(data){
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
            }   
        };
    }();
    G.onReady(App);    
});