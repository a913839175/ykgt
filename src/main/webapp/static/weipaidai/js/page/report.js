define(function(require, exports, module) {
    var Echarts = require('echarts');
    var countUp = require("countUp");
    var Handlebars = require('handlebars');
    var itemTpl = require('tpl/report.tpl');
    //数字千位符格式化
    function toThousands(totalCount) {
        var num = (totalCount || 0).toString().split(".");
        num[0] = num[0].replace(new RegExp('(\\d)(?=(\\d{3})+$)', 'ig'), "$1,");
        return num.join(".");
    }
    var params = {};
    
    G.get(Service.getStaticWebDataInfo,params,function(data){
        // console.log(data);
        $('.page-p1').html(data.total_lastday);
        $('.report01').html(data.runtime_years);
        $('.report02').html(data.runtime_months);
        $('.report03').html(data.runtime_days);
        $('.counter1').html(toThousands(data.total_amount));
        $('.counter2').html(toThousands(data.total_income));
        $('.counter3').html(toThousands(data.total_transaction));
        $('.counter4').html(toThousands(data.total_borrow_peoples));
        var wwArr = [];
        $.each(data.borrow_period_list.ww,function(key,item){
            var wwwidth = data.borrow_period_list.ww[key].value;
            var wwkey = data.borrow_period_list.ww[key].key;
            var index = parseInt(key) + 1;
            wwArr.push({'width':wwwidth});
            $("#bolistww").append("<li class='borrowqx-li01 boli"+index+"'>"+wwkey+"</li>");
            // $('.borrowqx-liv0'+index).html(wwwidth+'%');
            // $('.borrowqx-lik0'+index).attr('data-width',wwwidth+'%');
        });
        var newData = {'lists':wwArr}
        $("#boulww").template(itemTpl,newData);
        //微年利数据
        var wyyArr = [];
        $.each(data.borrow_period_list.wyy,function(key,item){
            var wyywidth = data.borrow_period_list.wyy[key].value;
            var wyykey = data.borrow_period_list.wyy[key].key;
            var index = parseInt(key) + 1; 
            wyyArr.push({'width':wyywidth});
            $("#bolistwyy").append("<li class='borrowqx-li01 boli"+index+"'>"+wyykey+"</li>");
            $('.borrowqx-liv'+index).html(wyywidth+'%');
            $('.borrowqx-lik'+index).attr('data-width',wyywidth+'%');
        });
        var newData = {'lists':wyyArr}
        $("#boulwyy").template(itemTpl,newData);
             
        //借款数据
        $('.borrowdatalib1').html(toThousands(data.total_loan_peoples));
        $('.borrowdatalib2').html(toThousands(data.total_loan_amount));
        $('.borrowdatalib3').html(toThousands(data.overdue_Rate));
        //数字动画  
        $('.counter').countUp({
            delay: 10,
            time: 1500
        });
        
        var pie1x = [];
        var pie1y = [];
        $.each(data.amount_list,function(k,item){
            pie1x.push(item.key);
            pie1y.push(item.value);
        });
        var pie1 = echarts.init(document.getElementById('pie1'));
        //投资金额分布
        var pieoption1 = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {d}%"
            },
            legend: { 
                y: 'bottom',
                itemGap:100,
                bottom:0,
                textStyle:{
                    color:'#777777',
                    fontSize:16
                },
                data: pie1x
            },
            graphic:{
                type:'text',
                left:'center',
                top:'center',
                style:{
                    text:'投资金额分布',
                    textAlign:'center',
                    fill:'#626262',
                    font:'20px Microsoft JhengHei'
                }
            },
            color:['#8cb2f2', '#ffc934','#82cc22'], 
            series: [{
                name: '投资金额分布',
                type: 'pie',
                hoverAnimation:true,
                radius: [100, 140],
                funnelAlign: 'center',
                max: 100,
                label:{
                    normal:{
                        formatter:'{d}%',
                        width:'20'
                    }
                }, 
                data: [{
                    value: pie1y[0],
                    name: '100-10000',
                    labelLine : {
                        normal:{
                            length : 20,
                            length2: 80,
                            lineStyle : {
                                width : 2
                            }
                        }                
                    }
                }, {
                    value: pie1y[1],
                    name: '10000-50000',
                    labelLine : {
                        normal:{
                            length : 10,
                            length2: 60,
                            lineStyle : {
                                width : 2
                            }
                        }                
                    }
                }, {
                    value: pie1y[2],
                    name: '>50000',
                    labelLine : {
                        normal:{
                            length : 20,
                            length2: 80,
                            lineStyle : {
                                width : 2
                            }
                        }                
                    }
                }]
            }]
        };
        pie1.setOption(pieoption1);

        var pie2x = [];
        var pie2y = [];
        $.each(data.sex_list,function(k,item){
            pie2x.push(item.key);
            pie2y.push(item.value);
        });
        var pie2 = echarts.init(document.getElementById('pie2'));
        //投资性别分布
        var pieoption2 = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} :{d}%"
            },
            legend: { 
                x: 'right',
                left:480,
                top:110,
                orient:'vertical',
                textStyle:{
                    color:'#777777',
                    fontSize:16
                },
                data: pie2x
            },
            graphic:{
                type:'text',
                left:'center',
                top:'center',
                style:{
                    text:'投资人性别分布',
                    textAlign:'center',
                    fill:'#626262',
                    font:'20px Microsoft JhengHei'
                }
            },
            color:['#ff768f', '#8cb2f2'],    
            series: [{
                name: '投资人性别分布',
                type: 'pie',
                hoverAnimation:false,
                radius: [100, 140],
                funnelAlign: 'center',
                max: 100,
                label:{
                    normal:{
                        show:false
                    }
                },
                data: [{
                    value: pie2y[0],
                    name: pie2x[0]
                },{
                    value: pie2y[1],
                    name: pie2x[1]
                }]
            }]
        };
        pie2.setOption(pieoption2);

        var pie3x = [];
        var pie3y = [];
        $.each(data.age_list,function(k,item){
            pie3x.push(item.key);
            pie3y.push(item.value);
        });
        var pie3 = echarts.init(document.getElementById('pie3'));
        //投资人年龄分布
        var pieoption3 = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {d}%"
            },
            legend: { 
                x: 'right',
                left:480,
                top:50,
                orient:'vertical',
                textStyle:{
                    color:'#777777',
                    fontSize:16
                },
                data: pie3x
            },
            graphic:{
                type:'text',
                left:'center',
                top:'center',
                style:{
                    text:'投资人年龄分布',
                    textAlign:'center',
                    fill:'#626262',
                    font:'20px Microsoft JhengHei'
                }
            },
            color:['#ff768f', '#f9a670','#77d989','#ffc934','#8cb2f2'], 
            series: [{
                name: '投资人年龄分布',
                type: 'pie',
                hoverAnimation:false,
                radius: [100, 140],
                funnelAlign: 'center',
                max: 100,
                label:{
                    normal:{
                        show:false
                    }
                }, 
                data: [{
                    value: pie3y[0],
                    name: pie3x[0],
                }, {
                    value: pie3y[1],
                    name: pie3x[1],
                }, {
                    value: pie3y[2],
                    name: pie3x[2],
                },{
                    value: pie3y[3],
                    name: pie3x[3],
                }, {
                    value: pie3y[4],
                    name: pie3x[4],
                }]
            }]
        };
        pie3.setOption(pieoption3);

        var fbxData = [];
        var fbyData = [];
        $.each(data.borrow_product_list,function(k,item){
            fbxData.push(item.key);
            fbyData.push(item.value);
        });
        var newfbyData = [];
        $.each(fbyData,function(n,v){
            var fbycolor = (n%2==0)?'#fef4ea':'#e4f2ff';
            var fbyborderColor = (n%2==0)?'#fec097':'#8ec5fb';
            newfbyData.push({
                name:'',
                value: v,
                itemStyle: {
                    normal: {
                        color: fbycolor,
                        borderWidth: 2,
                        borderColor: fbyborderColor
                    }
                }
            });
        });

        // 投资产品分布
        var fb = echarts.init(document.getElementById('fb'));

        // 投资产品分布
        var option1 = {
            tooltip: {
                trigger: 'axis',
            },
            color: ['#000'],
            grid: {
                left: '0%',
                right: '2%',
                bottom: '0%',
                containLabel: true
            },
            dataZoom: {
                show: true,
                realtime: true,
                //orient: 'vertical',   // 'horizontal'
                // x: 0,
                y: 20,
                // backgroundColor: 'rgba(221,160,221,0.5)',
                // dataBackgroundColor: 'rgba(138,43,226,0.5)',
                // fillerColor: 'rgba(38,143,26,0.6)',
                // handleColor: 'rgba(128,43,16,0.8)',
                //xAxisIndex:[],
                //yAxisIndex:[],
                height: 20,
                start: 20,
                end: 80
            },
            xAxis: [{
                type: 'category',
                data: fbxData,
                color: '#000',
                splitLine: {
                    show: true,
                    lineStyle: { //改变网格轴的颜色
                        color: ['#ebebeb']
                    }
                },
                axisLine: {
                    lineStyle: {
                        color: '#ebebeb',
                        width: 2, //坐标轴的颜色
                    }
                },
                //  改变x轴字体颜色和大小
                axisLabel: {
                    textStyle: {
                        color: '#626262',
                        fontSize: '16'
                    }
                }
            }],
            yAxis: [{
                type: 'value',
                splitLine: {
                    show: true,
                    lineStyle: { //改变网格轴的颜色
                        color: ['#ebebeb']
                    }
                },
                axisLine: {
                    lineStyle: {
                        color: '#ebebeb',
                        width: 2, //坐标轴的颜色
                    }
                },
                //  改变Y轴字体颜色和大小
                axisLabel: {
                    textStyle: {
                        color: '#626262',
                        fontSize: '16'
                    }
                }
            }],
            series: [{
                name:'',
                type:'bar',
                barWidth: 42,
                barGap: '10',
                data: newfbyData,
                label: {
                    normal: {
                        show: true,
                        position: 'top',
                        formatter: '{c}%',
                        textStyle: {
                            color: '#626262',
                            fontSize: 16,
                            lineHeight: 200
                        }
                    }
                }
            }]
        };
        // 投资产品分布
        fb.setOption(option1);

        // 借款类型的分布
        var myChartx = [];
        var myCharty = [];
        $.each(data.loan_type_list,function(k,item){
            myChartx.push(item.key);
            myCharty.push(item.value);
        });
        var new1fbyData = [];
        $.each(myCharty,function(n,v){
            var fb1ycolor = (n%2==0)?'#fef4ea':'#e4f2ff';
            var fb1yborderColor = (n%2==0)?'#fec097':'#8ec5fb';
            new1fbyData.push({
                name:'',
                value: v,
                itemStyle: {
                    normal: {
                        color: fb1ycolor,
                        borderWidth: 2,
                        borderColor: fb1yborderColor
                    }
                }
            });
        });

        var myChart = echarts.init(document.getElementById('main'));

        // 借款类型的分布
        var option = {
            tooltip: {
                trigger: 'axis',
            },
            color: ['#000'],
            calculable: true,
            grid: {
                left: '0%',
                right: '2%',
                bottom: '0%',
                containLabel: true
            },
            dataZoom: {
                show: true,
                realtime: true,
                //orient: 'vertical',   // 'horizontal'
                // x: 0,
                y: 20,
                // backgroundColor: 'rgba(221,160,221,0.5)',
                // dataBackgroundColor: 'rgba(138,43,226,0.5)',
                // fillerColor: 'rgba(38,143,26,0.6)',
                // handleColor: 'rgba(128,43,16,0.8)',
                //xAxisIndex:[],
                //yAxisIndex:[],
                height: 20,
                start: 20,
                end: 80
            },
            xAxis: [{
                type: 'category',
                data: myChartx,
                color: '#000',
                splitLine: {
                    show: true,
                    lineStyle: { //改变网格轴的颜色
                        color: ['#ebebeb']
                    }
                },
                axisLine: {
                    lineStyle: {
                        color: '#ebebeb',
                        width: 1, //坐标轴的颜色
                    }
                },
                //  改变x轴字体颜色和大小
                axisLabel: {
                    textStyle: {
                        color: '#626262',
                        fontSize: '16'
                    }
                }
            }],
            yAxis: [{
                type: 'value',
                splitLine: {
                    show: true,
                    lineStyle: { //改变网格轴的颜色
                        color: ['#ebebeb']
                    }
                },
                axisLine: {
                    lineStyle: {
                        color: '#ebebeb',
                        width: 1, //坐标轴的颜色
                    }
                },
                //  改变Y轴字体颜色和大小
                axisLabel: {
                    textStyle: {
                        color: '#626262',
                        fontSize: '16'
                    }
                }
            }],
            series: [{
                name: '',
                type: 'bar',
                barWidth: 42,
                barGap: '10',
                data: new1fbyData,
                label: {
                    normal: {
                        show: true,
                        position: 'top',
                        formatter: '{c}%',
                        textStyle: {
                            color: '#626262',
                            fontSize: 16,
                            lineHeight: 200
                        }
                    }
                }
            }]
        }
        // 借款类型的分布
        myChart.setOption(option);
        G.progress();
    });
    //进度条加载
    $(window).scroll(function() {
        G.progress()
    });

});