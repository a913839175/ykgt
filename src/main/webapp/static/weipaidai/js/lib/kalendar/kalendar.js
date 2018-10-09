define(function(require, exports, module) { 
	var kalendar = {
		nowDate: new Date(),
		ajaxData: null,
		init:function(){
			this.getFullYear = this.nowDate.getFullYear();
			this.getMonth = this.nowDate.getMonth() + 1;
			this.setDate();
			this.bindEvent();
		},
		setDate:function(){
			var year = this.getFullYear;
			var month = this.getMonth;
			$('#J_year').val(year);
			$('#J_month').val(month);
			this.createDay();
		},
		//获取某一月有多少天, month为实际月份，一月即为1
		getDateLength : function(year,month){            
            return new Date(year,month,0).getDate();
        },
        //获取某一月第一天是周几,month为实际月份，一月即为1,返回0即为周日
        getFirstDay : function(year,month){
            return new Date(year,month-1,1).getDay();
        },
		//读取年月写入日历  重点算法!!!!!!!!!!!
	    createDay:function () {
	    	var _this = this;
	    	var yyyy = _this.getFullYear;
	    	var mm = _this.getMonth;
	    	var dd = _this.nowDate.getDate();

	        var daysCount = _this.getDateLength(yyyy,mm); //本月天数 
	        var lastMonth = _this.getDateLength(yyyy,mm-1); //上一月天数	         
	        var week = _this.getFirstDay(yyyy,mm); //第一天周几

	        var i,html = ""; //写入代码
	        //循环输出月前空格
            // if(week ===0) week = 7;
            for(i = 1; i < week + 1; i++){
                html += "<div class='f-td f-null' style='color:#ccc;'>" + (lastMonth - week + i) + "</div>";
            }
            //循环输出当前月所有天
            for(i = 1; i <= daysCount; i++){
                html += "<div class='f-td f-number'><span day='" + i + "'class='f-day'>" + i + "</span></div>";
            }
	        //循环输出月后空格
	        if (7 - (daysCount + week) % 7 < 7) {
	            for (k = 1; k <= 7 - (daysCount + week) % 7; k++) { // week为今天周几 daysCount为本月天数  7-week为本行空格数 7-(daysCount+6-week)%7为最后一行有几个空格
	                html += "<div class='f-td f-null'>" + k + "</div>";
	            }
	        }

	        //写入日历
	        $(".f-rili-table .f-tbody").html(html);

	        //给今日加class
	        if (new Date().getFullYear() == yyyy) {
	            if ((new Date().getMonth() + 1) == mm) {
	                var today = new Date().getDate();
	                $('.f-number').eq(dd - 1).find('span').html('今')
	                $('.f-number').eq(dd - 1).addClass("f-today");
	            }
	        }
	        _this.getData();
	    },
	    getData:function(){
	    	var _this = this;
	    	//补0
			var Appendzero = function (num) {return num < 10 ? ('0'+num) : (''+num)};   
	    	var data_month = _this.getFullYear + '-' + Appendzero(_this.getMonth);
	    	G.get(Service.shouyis, { data_month: data_month}, function(data) {
	    		_this.ajaxData = data;
	    		if (!data.us_token_msg) {
	                //显示本月应还，本月未还
	                $("#yingshou").find("em").html((data.receivable_month).toFixed(2));
	                // $("#weishou").find("em").html(data.await_receive_month);
	                if(data.lists){
	                    var ListData = data.lists;
	                    $.each(ListData, function(index, item){
	                        var mdate = new Date(item.date);
	                        var mday = mdate.getDate();
	                        if(item.receivable_income > 0 && mdate.getFullYear() == _this.getFullYear && (mdate.getMonth() + 1) == _this.getMonth){	                                                   
	                            $(".f-rili-table .f-number").eq(index).append('<span class="dotted"></span>');                           
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

	                }               
	            }
	    	});
	    },
		randerHtml:function(){

		},
		bindEvent:function(){
			var _this = this;
			//select按钮时间
			$('.query-area select').change(function(){ 
				_this.getFullYear = parseInt($('#J_year').val());
        		_this.getMonth = parseInt($('#J_month').val());
		        _this.createDay();
		    });
		    //绑定选择方法
		    $(document).on("click",".f-number",function(){
		    	var cld = $(this).find(".f-day").attr("day");
	            $(this).addClass("f-on").siblings().removeClass("f-on");
	            var ListData = _this.ajaxData.lists;

	            var currincome = ListData[cld-1].receivable_income;
	            var repay_hb_interest = ListData[cld-1].repay_hb_interest;
	            var repay_capital = ListData[cld-1].repay_capital;

                if(currincome > 0){
                    $("#huidesc").html("当天投资收益：<em class='ysy'>"+currincome+"</em>元"+"<br/>当天红包收益：<em class='ysy'>"+repay_hb_interest+"</em>元"+"<br/>当天应收本金：<em class='ysy'>"+repay_capital+"</em>元");
                }else{
                    $("#huidesc").html("当天没有项目回款<br/><a href='/invest' target='_blank'>快去投资</a>吧");
                }               
                
                if( $(".f-on").hasClass('f-today')){
                    $("#huikuan_date").html("<i class='now'></i><em class='vam'>"+ListData[cld-1].date+"</em>");
                }else{
                    $("#huikuan_date").html("<i class='hui'></i><em class='vam'>"+ListData[cld-1].date+"</em>");
                }                                           
		    });
		    //日历上一月
		    $(".preBtn").on('click',function() {
		        var yy = parseInt($('#J_year').val());
		        var mm = parseInt($('#J_month').val());	        
		        _this.getFullYear = (mm == 1) ? yy-1 : yy;
		        _this.getMonth = (mm == 1) ? 12 : mm - 1;
		        _this.setDate();
		    });
		    //日历下一月
		    $(".nextBtn").on('click',function() {
		        var yy = parseInt($('#J_year').val());
		        var mm = parseInt($('#J_month').val());
				_this.getFullYear = (mm == 12) ? yy + 1 : yy;
		        _this.getMonth = (mm == 12) ? 1 : mm + 1;
		        _this.setDate();
		    });	        
		}
	}
	return kalendar.init();
});