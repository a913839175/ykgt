define(function(require, exports, module) {
    var Validform = require('Validform');
    var jsencrpt = require('JSEncrypt');
    var EnPlaceholder = require("EnPlaceholder");
    $('input').placeholder();
    var itemAid = $("#itemAid").val();
    var itemSid = $("#itemSid").val();
    var itemCount = $("#itemCount").val();
    var itemPrice = $("#vervbi").html();
    var smsPhone = $(".intphone").val();
    require('mall/mallmeta');
    //发送短信
    $(document).on('click','.senddx',function(){      
        var code = $(this);             
        var params = {
            mobile: smsPhone,
            action: "AFFRIMORDER"
        };
        G.sendText(params,code);
    });
    var confirmForm = $('.suremain').Validform({
        btnSubmit: "#J_surecode",
        tiptype: 3,
        beforeSubmit: function(curform) {
            corderconfirm();
        }
    });
    var encodeStr = function(STR, TOKEN) {
        return JSEncrypt(STR, PAGENAME, TOKEN, PAGEWEB);
    };
    var corderconfirm = function(){
        var postData = JSON.stringify({
            'user_id': webAppInfo.user_id,
            'aid': itemAid,
            'sid': itemSid,
            'count': itemCount,
            'price': itemPrice,
            'smsPhone': smsPhone,
            'smsCode': $(".smscode").val()
        });
        var subtime = new Date().getTime()+"";
        var params = {
            userVerify: encodeStr(postData, subtime),
            unixkey: subtime
        };
        $(".surecode").addClass("btn-disable").attr("disabled","true");
        G.showLoading();
        G.post(Service.subOrder, params, function(data) {
            G.hideLoading();
            $('.surecode').removeClass("btn-disable").removeAttr("disabled");
            if (data.returnCode == "1") {
                location.replace("/mall/ordercomplete?sid="+itemSid);
            } else if (data.returnMsg.indexOf("验证码") > -1) {
                $(".Validform_checktip").html(data.returnMsg);
            }else {
                G.$alert(data.returnMsg, false,function(){
                    location.replace("/mall");
                },true);   
            }
        },function(data){
            $(".surecode").removeClass("btn-disable").removeAttr("disabled");
        });
    };
});