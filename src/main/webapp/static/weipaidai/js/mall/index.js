define(function(require, exports, module) {
    var flexslider = require("flexslider");
    var select = require('select');
    var $myselect = $(".myselect").select();
    var jsencrpt = require('JSEncrypt');
    var lazyload = require('lazyload');
    var hblist = ""; //红包列表空
    var hbkind = 0; //红包类型现金红包
    require('mall/mallmeta');
    $("img.lazy").lazyload();
    var encodeStr = function(STR, TOKEN) {
        return JSEncrypt(STR, PAGENAME, TOKEN, PAGEWEB);
    };
    //首页banner轮播
    $('.flexslider').flexslider({
        directionNav: true, //是否显示左右方向箭头按钮
        pauseOnAction: false, //是否显示左右方向箭头按钮
        animationSpeed: 1000, //动画时间
        slideshowSpeed: 4000 //停留时间
    });
    $('.info_li').on('click', function() {
        $('.info_li').removeClass('info_liactive');
        $(this).addClass('info_liactive');
        var cid = $(this).attr("data-cid");
        renderData(cid);
    });
    //加载红包列表
    function renderData(hbkind) {
        var hblist = ""; //红包列表空
        $('.jf_sanjinum').val('1');
        $("#sul1").html('');
        $('#ikc').html('');
        $('#weibz').html('');
        G.post(Service.bonusList, {}, function(data) {
            var cid = parseInt(hbkind) + 1;
            if (data.lists.length) {
                $.each(data.lists[hbkind].bonuses, function(k, v) {
                    hblist += "<li class='select-list' data-store=" + v.store + " data-price=" + v.price + " data-id=" + v.id + " data-cid=" + cid + ">" + v.name + "</li>";
                });
                $("#sul1").append(hblist);
                if (data.lists[hbkind].bonuses.length === 0) {
                    $('.select-option').html("暂无数据");
                    $('#ikc').html("0");
                    $('#weibz').html("0");

                } else {
                    $('.select-option').html(data.lists[hbkind].bonuses[0].name);
                    $('.select-option').attr('data-price', data.lists[hbkind].bonuses[0].price);
                    $('.select-option').attr('data-id', data.lists[hbkind].bonuses[0].id);
                    $('.select-option').attr('data-cid', cid);
                    $('#weibz').html(data.lists[hbkind].bonuses[0].price * 1);
                    if (parseInt(data.lists[hbkind].bonuses[0].store) > 0) {
                        $('#ikc').html(data.lists[hbkind].bonuses[0].store);
                    } else {
                        $('#ikc').html("0");
                    }
                }
            } else {
                $('.select-option').html("暂无数据");
                $('#ikc').html("0");
                $('#weibz').html("0");
                $('#jianlang').addClass('sureinfopactive');
                $('#jialang').addClass('sureinfopactive');
            }
        });
        $('#jianlang').addClass('sureinfopactive').siblings().removeClass('sureinfopactive');
    }
    renderData(hbkind);
    $('#jianlang').on('click', function() {
        var sureinfo03p02 = parseInt($('.jf_sanjinum').val()); //商品数量
        var sureinfo02 = parseInt($(this).parents('.info06').find('#selecto1').attr('data-price')); //所需微币数
        var realPayprice = parseInt($('#weibz').html()); //实付微币
        var select_option = $('#selecto1').html();
        if (select_option == "暂无数据") {
            return false;
        } else if (sureinfo03p02 <= 1) {
            $('#jianlang').addClass('sureinfopactive').siblings().removeClass('sureinfopactive');
            return false;
        } else {
            sureinfo03p02--;
            $('#jianlang').removeClass('sureinfopactive');
            $('#jialang').removeClass('sureinfopactive');
            $('.jf_sanjinum').val(sureinfo03p02);
            $('#weibz').html(sureinfo03p02 * sureinfo02);
            if (sureinfo03p02-- == 1) {
                $('#jianlang').addClass('sureinfopactive').siblings().removeClass('sureinfopactive');
            }
        }
    });
    $('#jialang').on('click', function() {
        var sureinfo03p02 = parseInt($('.jf_sanjinum').val()); //商品数量
        var sureinfo02 = parseInt($(this).parents('.info06').find('#selecto1').attr('data-price')); //所需微币数
        var realPayprice = parseInt($('#weibz').html()); //实付微币
        var select_option = $('#selecto1').html();
        var kc = $('#ikc').html(); //库存
        if (select_option == "暂无数据") {
            return false;
        } else if (sureinfo03p02 >= kc) {
            alert('已超出库存');
            ('#jialang').addClass('sureinfopactive');
            return false;
        } else if (sureinfo03p02 >= 10) {
            if (select_option == "暂无数据") {
                return false;
            } else {
                $('#jialang').addClass('sureinfopactive').siblings().removeClass('sureinfopactive');
                return false;
            }

        } else {
            sureinfo03p02++;
            $('#jianlang').removeClass('sureinfopactive');
            $('#jialang').removeClass('sureinfopactive');
            $('.jf_sanjinum').val(sureinfo03p02);
            $('#weibz').html(sureinfo03p02 * sureinfo02);
            if (sureinfo03p02++ == 10) {
                $('#jialang').addClass('sureinfopactive').siblings().removeClass('sureinfopactive');
            }
        }
    });
    $(document).on('click', '.select-list', function() {
        var self = this;
        // console.log(self)
        var data_id = $(this).attr('data-id');
        var data_price = parseInt($(this).attr('data-price'));
        var data_name = $(this).html();
        var data_cid = $(this).attr('data-cid');
        var data_store = $(this).attr('data-store');
        var sureinfo03p02 = parseInt($('.jf_sanjinum').val()); //商品数量
        $('#selecto1').html(data_name);
        $('#selecto1').attr('data_price', data_price);
        $('#selecto1').attr('data-id', data_id);
        $('#selecto1').attr('data-cid', data_cid);
        $('#ikc').html(data_store);
        $('#weibz').html(sureinfo03p02 * data_price);
    });
    $(document).on('click', '.info09', function() {
        var userid = $('#userid').val();
        var kc = parseInt($('#ikc').html()); //库存
        var iwb = parseInt($('#iwb').html()); //微币数
        var weibz = parseInt($('#weibz').html()); //物品所需微币
        if (!userid) {
            G.$alert("您还没登录！", false, function() {
                window.location = "/user/login?oauth=/mall";
            }, true);
        } else {
            if (kc <= 0) {
                G.$alert("库存不足！", false);
            } else if (iwb < weibz) {
                G.$alert("您的微币不足！", false);
            } else {
                $(this).addClass("btn-disable").attr("disabled", "true");
                G.showLoading();
                var params = JSON.stringify({
                    userId: $('#userid').val(),
                    cid: $(this).parents('.info06').find('#selecto1').attr('data-cid'),
                    bounsId: $(this).parents('.info06').find('#selecto1').attr('data-id'),
                    buyCount: $(this).parents('.info06').find('.jf_sanjinum').val()
                });
                var subtime = new Date().getTime() + "";
                G.post(Service.bonusExc, {
                    userVerify: encodeStr(params, subtime),
                    unixkey: subtime
                }, function(data) {
                    G.hideLoading();
                    if (data.returnCode == 1) {
                        G.$alert(data.returnMsg, true, function() {
                            window.location.reload();
                        }, true);
                    } else {
                        G.$alert(data.returnMsg, false, function() {
                            window.location.reload();
                        }, true);
                    }
                });
            }
        }
    });
    $(document).on('click', '.sureinstr', function() {
        $('.max1').hide();
    });
    $('.info10').on('click', function() {
        $('.max1').show();
    });
});