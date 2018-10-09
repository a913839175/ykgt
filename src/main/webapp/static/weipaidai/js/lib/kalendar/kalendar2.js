define(function(require, exports, module) {
    function changeDecimalBuZero(number, bitNum) {  
       /// <summary>  
       /// 小数位不够，用0补足位数  
       /// </summary>  
       /// <param name="number">要处理的数字</param>  
       /// <param name="bitNum">生成的小数位数</param>  
       var f_x = parseFloat(number);  
       if (isNaN(f_x)) {  
           return 0;  
       }  
       var s_x = number.toString();  
       var pos_decimal = s_x.indexOf('.');  
       if (pos_decimal < 0) {  
           pos_decimal = s_x.length;  
           s_x += '.';  
       }  
       while (s_x.length <= pos_decimal + bitNum) {  
           s_x += '0';  
       }  
       return s_x;  
    }
    //页面加载初始化年月
    var mydate = new Date();

    $(".f-year").html(mydate.getFullYear());
    $(".f-month").html(mydate.getMonth() + 1);

    var setDate = function (y, m) {
        $("#J_month option").removeAttr("selected"); //移除属性selected
        $("#J_year option").removeAttr("selected"); //移除属性selected
        $('#J_month').find('option[value= ' + m + ']').attr('selected', true);
        $('#J_year').find('option[value= ' + y + ']').attr('selected', true);
    }
    //读取年月写入日历  重点算法!!!!!!!!!!!
    var showDate = function (yyyy, mm) {
        var dd = new Date(parseInt(yyyy), parseInt(mm), 0); //Wed Mar 31 00:00:00 UTC+0800 2010  
        var daysCount = dd.getDate(); //本月天数  
        //console.log(daysCount);
        var mystr = ""; //写入代码
        var week = new Date(parseInt(yyyy) + "/" + parseInt(mm) + "/" + 1).getDay(); //第一天周几
        //console.log(week);
        var lastMonth; //上一月天数
        var nextMounth //下一月天数
        if (parseInt(mm) == 1) {
            lastMonth = new Date(parseInt(yyyy) - 1, parseInt(12), 0).getDate();
        } else {
            lastMonth = new Date(parseInt(yyyy), parseInt(mm) - 1, 0).getDate();
        }
        if (parseInt(mm) == 12) {
            nextMounth = new Date(parseInt(yyyy) + 1, parseInt(1), 0).getDate();
        } else {
            nextMounth = new Date(parseInt(yyyy), parseInt(mm) + 1, 0).getDate();
        }
        for (i = 0; i < daysCount; i++) {
            //计算上月空格数
            if (i % 7 == 0) {
                if (i < 7) { //只执行一次
                    for (j = 0; j < week; j++) {
                        var m = week;
                        mystr += "<div class='f-td f-null' style='color:#ccc;'></div>";
                    }
                }
            }
            //这里为一个单元格，添加内容在此
            mystr += "<div class='f-td f-number' style='cursor:pointer'><span class='f-day' day='" + (i + 1) + "'>" + (i + 1) + "</span>"
                // +"<div class='f-yuan'></div>"
                //+"<div class='f-table-msg'>回款中<span class='major'>1</span>笔。回款本息;<span class='major'>1，000，000</span>元</div>"//这里加判断
                + "</div>";
        }

        //计算下月空格数
        //         for(k=0; k<42-(daysCount+6-week);k++ ){//表格保持等高6行42个单元格
        //            mystr += "<div class='f-td f-null' style='color:#ccc;'>"+(k+1)+"</div>";
        //        }

        //表格不等高，只补充末行不足单元格
        if (7 - (daysCount + week) % 7 < 7) {
            for (k = 0; k < 7 - (daysCount + week) % 7; k++) { // week为今天周几 daysCount为本月天数  7-week为本行空格数 7-(daysCount+6-week)%7为最后一行有几个空格
                mystr += "<div class='f-td f-null' style='color:#ccc;'></div>";
            }
        }


        //写入日历
        $(".f-rili-table .f-tbody").html(mystr);
        //给今日加class
        if (mydate.getFullYear() == yyyy) {
            if ((mydate.getMonth() + 1) == mm) {
                var today = mydate.getDate();
                $('.f-number').eq(today - 1).find('span').html('今')
                $('.f-number').eq(today - 1).addClass("f-today");
            }
        }

        //绑定选择方法
        $(".f-rili-table .f-number").off("click");
        var cflag = false;
        $(".f-rili-table .f-number").on("click", function() {
            var cld = $(this).find(".f-day").attr("day");
            var cflag = true;
            $(".f-rili-table .f-number").removeClass("f-on");
            $(this).addClass("f-on");       
            getData(yyyy, mm ,cld,cflag);           
        });

        getData(yyyy, mm,1,cflag);

    }
    var Appendzero = function (number) {  
        if(number<10) return "0" + "" + number;  
        else return number;  
    };
    var getData = function (yyyy, mm,cld,cflag) {
        //异步请求数据
        var year = $(".f-year").html();
        var month = $(".f-month").html();
        var day = null;
        var day_ = $(".f-on").find(".f-day").html();
        if (day_ == null || day_ == "" || "今" == day_) {
            day = $(".f-today").find(".f-day").attr("day");
        } else {
            day = day_;
        }

        var data_month = year + '-' + Appendzero(month);
        G.get(Service.shouyis, {
            data_month: data_month
        }, function(data) {
            if (!data.us_token_msg) {
                //显示本月应还，本月未还
                $("#yingshou").find("em").html((data.receivable_month).toFixed(2));
                // $("#weishou").find("em").html(data.await_receive_month);
                if(data.lists){
                    var ListData = data.lists;
                    var currincome = ListData[cld-1].receivable_income;
                    var repay_hb_interest = ListData[cld-1].repay_hb_interest;
                    var repay_capital = ListData[cld-1].repay_capital;
                    $.each(ListData, function(index, item){
                        var mdate = new Date(item.date);
                        var mday = mdate.getDate();
                        if(item.receivable_income > 0 && mdate.getFullYear() == yyyy){
                            if((mdate.getMonth() + 1) == mm){                       
                                $(".f-rili-table .f-number").eq(index).append('<span class="dotted"></span>');
                            }
                        }
                    });
                    var fday = $(".f-today").find(".f-day").attr("day");
                    if( fday != null && fday){
                        $("#huikuan_date").html("<i class='now'></i><em class='vam'>" + ListData[fday-1].date + "</em>");
                    } else {
                        if($(".f-on").find(".f-day").html() == null){
                            $(".f-rili-table .f-number").removeClass("f-on");
                            if($(".f-today").find(".f-day").attr("day") == null){
                                $('span[day="1"]').parent().addClass("f-on");
                            }
                        }
                        $("#huikuan_date").html("<i class='hui'></i><em class='vam'>" +ListData[0].date+ "</em>");                  
                    }
                    if(currincome > 0){
                        $("#huidesc").html("当天投资收益：<em class='ysy'>"+currincome+"</em>元"+"<br/>当天红包收益：<em class='ysy'>"+repay_hb_interest+"</em>元"+"<br/>当天应收本金：<em class='ysy'>"+repay_capital+"</em>元");
                    }else{
                        $("#huidesc").html("当天没有项目回款<br/><a href='/invest' target='_blank'>快去投资</a>吧");
                    }               
                    if(cflag){
                        if( $(".f-on").hasClass('f-today')){
                            $("#huikuan_date").html("<i class='now'></i><em class='vam'>"+ListData[fday-1].date+"</em>");
                        }else{
                            $("#huikuan_date").html("<i class='hui'></i><em class='vam'>"+ListData[cld-1].date+"</em>");
                        }                           
                    }               
                }               
            }
        })
    }
    showDate(mydate.getFullYear(), mydate.getMonth() + 1);
    setDate(mydate.getFullYear(), mydate.getMonth() + 1);

    //收款明细
    //select按钮时间
    $('.query-area select').change(function(){ 
        var y = parseInt($('#J_year').val());
        var m = parseInt($('#J_month').val());
        //存储年月
        $(".f-year").html(y);
        $(".f-month").html(m);
        showDate(y, m);
    });
    //console.log(mydate.getFullYear());
    //日历上一月
    $(".preBtn").on('click',function() {
        var mm = parseInt($(".f-month").html());
        var yy = parseInt($(".f-year").html());
        if (mm == 1) { //返回12月
            $(".f-year").html(yy - 1);
            $(".f-month").html(12);
            setDate(yy - 1, 12);
            showDate(yy - 1, 12);
        } else { //上一月
            setDate(yy, mm - 1);
            $(".f-month").html(mm - 1);
            showDate(yy, mm - 1);
        }
    })
    //日历下一月
    $(".nextBtn").on('click',function() {
        var mm = parseInt($(".f-month").html());
        var yy = parseInt($(".f-year").html());
        if (mm == 12) { //返回12月
            $(".f-year").html(yy + 1);
            $(".f-month").html(1);
            setDate(yy + 1, 1);
            showDate(yy + 1, 1);
        } else { //上一月
            $(".f-month").html(mm + 1);
            setDate(yy, mm + 1);
            showDate(yy, mm + 1);
        }
    });
});