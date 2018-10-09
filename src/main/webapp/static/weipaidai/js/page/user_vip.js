define(function(require, exports, module){
    require('page/account_common.js');
	var params = {};
    var $li_1 = "";
    var $li_2 = "";
    var li_1 = $('.li_1');
    var li_2 = $('.li_2');
	G.post(Service.rewardList, params, function(data){
    	var newarr1 = [];
    	var grade = parseInt(data.body.grade)||1;
        var vipdj = grade + 1;
    	var grow_value = parseInt(data.body.grow_value)||0;
    	var grow_max_value = parseInt(data.body.grow_max_value)||50000;
    	var hc_value = grow_max_value - grow_value;
    	var grade_status = JSON.parse(data.body.grade_status);
        var vdata = {
            "hasPay": grow_value,
            "items": [{
                "name": "水钻",
                "money": 0
            }, {
                "name": "白钻",
                "money": 50000
            }, {
                "name": "黄钻",
                "money": 200000
            }, {
                "name": "绿钻",
                "money": 500000
            }, {
                "name": "蓝钻",
                "money": 1000000
            }, {
                "name": "粉钻",
                "money": 3000000
            }, {
                "name": "红钻",
                "money": 5000000
            }, {
                "name": "紫钻",
                "money": 8000000
            }, {
                "name": "黑钻",
                "money": 10000000
            }]       
        };
        var APP = function(){
            if(vdata&&vdata.items&&vdata.hasPay){
                /*currentNode当前节点数;overMoney超所在的区间下限额度;temp临时变量;redLine进度条长度占比;*/
                var hStr='',currentNode=0,overMoney=0,temp=0,redLine=0;
                /*构造节点数据*/
                for(var node in vdata.items){
                    if(vdata.items[node].money<=vdata.hasPay){
                        currentNode+=1;
                        temp=vdata.items[node].money;
                    }
                    overMoney=vdata.hasPay-temp;
                }
                /*计算进度条位置*/
                if(currentNode&&currentNode>0&&currentNode<=vdata.items.length){
                    if(currentNode == vdata.items.length){
                       redLine=100;
                    }else{
                        redLine=(currentNode-1)/(vdata.items.length-1);
                        redLine+=(overMoney/(vdata.items[currentNode].money-vdata.items[currentNode-1].money))*(1/(vdata.items.length-1));
                        redLine=redLine*100;
                        redLine=redLine>100?100:redLine;
                        redLine=redLine<0?0:redLine;
                    }
                }
                /*进度条滑动特效*/
                var t=1000,i=0,speedup=14,startspeed=1,currentMoney=0;
                setTimeout(function(){
                    var timer=setInterval(function(){
                        if(i<=500){
                            i+=startspeed+((i/500)*speedup);
                        }else if(i>500){
                            i+=startspeed+speedup-+(((i-500)/500)*speedup);
                        }
                        currentMoney = parseInt(i*vdata.hasPay/t);
                        if(i>=t){
                            i=t;
                            currentMoney=vdata.hasPay;
                        }
                        setPosition((redLine*(i/t)),currentMoney);
                            if(i>=t){
                                clearInterval(timer);
                            }
                    },10);
                },100);
            }
             /*设置进度条当前位置*/
            function setPosition(p,money){
                for(var n in vdata.items){
                  if(p/100>=n/(vdata.items.length-1)){
                     $(".vip-list").eq(n).addClass('active');
                     if((n-1)>=0){
                        $(".liqu").eq(n-1).addClass('active');
                     }                  
                  }
                }
                $('.progress').css("width",p+'%');
            }
            //领取显示
            // for(i=1;i<currentNode;i++){
            //     var liqu = ".liqu" + i;
            //     $(liqu).find('.numbutton').addClass("numbuttonactive");
            //     for(j=currentNode;j<9;j++){
            //        var liqu = ".liqu" + j;
            //        $(liqu).find('.num').addClass("numactive");
            //     }
            // }
        };
        APP();
		$('#vipgrade').html("V<sub>"+grade+"</sub>");
		$('.growValue').html(grow_value);
		$('.hcValue').html(hc_value);
		$('.vipdj').html("V"+vipdj);
        if(!grade_status){
            var $li_1 = "<a href='/user/reg' class='xtd1'>去注册</a>";
            li_1.append($li_1);
            var $li_2 = "<a href='/user/reg/type/realname' class='xtd2'>去实名</a>";
            li_2.append($li_2);
        }else{
            $.each(grade_status,function(k,v){
                if(v.task == 9){
                    if(v.receive == 1){
                        var $li_1 = "<button class='ctd1'></button>";
                        li_1.append($li_1)
                        $('.ctd1').removeClass('vtd04').addClass('vtd05');
                        $('.ctd1').html('领取');
                        $('.ctd1').attr('data-id',v.task);

                    }else if(v.receive == 2){
                        var $li_1 = "<button class='ctd1'></button>";
                        li_1.append($li_1)
                        $('.ctd1').removeClass('vtd05').addClass('vtd04');
                        $('.ctd1').html('已完成');
                        $('.ctd1').attr('data-id',v.task);

                    }else{
                        var $li_1 = "<a href='/user/reg' class='xtd1'>去注册</a>";
                        li_1.append($li_1);
                    }
                }else if(v.task == 10){
                    if(v.receive == 1){
                        var $li_2 = "<button class='ctd2'></button>";
                        li_2.append($li_2);
                        $('.ctd2').removeClass('vtd04').addClass('vtd05');
                        $('.ctd2').html('领取');
                        $('.ctd2').attr('data-id',v.task);
                    }else if(v.receive == 2){
                        var $li_2 = "<button class='ctd2'></button>";
                        li_2.append($li_2);
                        $('.ctd2').removeClass('vtd05').addClass('vtd04');
                        $('.ctd2').html('已完成');
                        $('.ctd2').attr('data-id',v.task);
                    }else{
                        var $li_2 = "<a href='/user/reg/type/realname' class='xtd2'>去实名</a>";
                        li_2.append($li_2);
                    }
                }else{
                    if(v.receive == 1){
                        $('.numbutton'+v.task).css('background','#ff4040');
                        $('.numbutton'+v.task).html('领取');
                    }else if(v.receive == 2){
                        $('.numbutton'+v.task).css('background','#dedede');
                        $('.numbutton'+v.task).html('已领取');
                        $('.numbutton'+v.task).prev().addClass('numactive');
                    }
                }
            });
        }
	},function(data){
        $('#vipgrade').addClass('vipliimg01');
        $('.growValue').html(0);
        $('.hcValue').html(50000);
        $('.vipdj').html("V2");
    });
    function getstatus(data){
        var grade = parseInt(data.body.grade)||1;
        var vipdj = grade + 1;
        var grow_value = parseInt(data.body.grow_value)||0;
        var grow_max_value = parseInt(data.body.grow_max_value)||50000;
        var hc_value = grow_max_value - grow_value;

        $('#vipgrade').html("V<sub>"+grade+"</sub>");
        $('.growValue').html(grow_value);
        $('.hcValue').html(hc_value);
        $('.vipdj').html("V"+vipdj);
    }; 
    $(document).on('click','.ctd1',function(){
        G.post(Service.getReward, {type:9}, function(data){ 
        if(data.result == '1'){  
            $('.ctd1').removeClass('vtd05').addClass('vtd04');
            $('.ctd1').html('已完成');
            G.$alert("恭喜您成功获取了100点成长值！",true);
            getstatus(data);
        }else if(data.result == '-2'){
            G.$alert("你好,奖励已领取！",false); 
        }else if(data.result == '-3'){
            G.$alert("你好,奖励不可领取！",false);
        }
       })
    });
    $(document).on('click','.ctd2',function(){
        G.post(Service.getReward, {type:10}, function(data){ 
            if(data.result == '1'){           
                $('.ctd2').removeClass('vtd05').addClass('vtd04');
                $('.ctd2').html('已完成');
                G.$alert("恭喜您成功获取了500点成长值！",true);
                getstatus(data);
            }else if(data.result == '-2'){
                G.$alert("你好,奖励已领取！",false); 
            }else if(data.result == '-3'){
                G.$alert("你好,奖励不可领取！",false);
            }
        })
    });
    $(document).on('click','.numbutton',function(){
        var numbutton = $(this).attr('data-id');
        var newnumbutton =".numbutton" + numbutton;
        G.post(Service.getReward, {type:numbutton}, function(data){ 
        if(data.result == '1'){              
            $(newnumbutton).css('background','#dedede');
            $(newnumbutton).html('已领取');
            $(newnumbutton).prev().addClass('numactive');
            getstatus(data);
        }else if(data.result == '-2'){
            G.$alert("你好,积分已领取！",false); 
        }else if(data.result == '-3'){
            G.$alert("你好,积分不可领取！",false);
        }
       })
    });
});