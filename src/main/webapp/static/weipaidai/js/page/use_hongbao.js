define(function(require, exports, module){
	var pagination = require('pagination');
	var Handlebars = require('handlebars');
	var itemTpl = require('tpl/user_hongbao.tpl');
	require('page/account_common.js');
	var hongbao = {
		params:{
			status:0,
			page:1,
			epage:4
		},
		bindFlag:true,
		init:function(){
			this.bindEvent();
			this.renderData();
			this.profit();
		},
		profit:function(){
			G.post(Service.package_profit,{},function(data){
			 	$('.hbshouyi_span1').html(data.total_profit);
			 	$('.hbshouyi_span2').html(data.cash_profit);
			 	$('.hbshouyi_span3').html(data.investment_profit);
			 	$('.hbshouyi_span4').html(data.add_rate_profit);
		 	});
		},
		//初始化投资产品列表
		renderData:function(){
			var _this = this
			G.post(Service.hongbaolist,_this.params,function(data){
				data.status = _this.params.status;
				var itemHtml = Handlebars.compile(itemTpl);
			    $("#hbList").html(itemHtml(data));
			    if(data.total){
		            $('.M-box').show();
		        }else{
		            $('.M-box').hide();
		        }
			    if(_this.bindFlag){
			    	$('.M-box').pagination({
					    totalData:data.total,
					    showData:4,
					    coping:true,
					    callback:function(api){
					    	_this.bindFlag = false;
					    	//再次渲染列表
					    	_this.params.page = api.getCurrent();
					    	_this.renderData();
					    }
					});
			    }	    		
			});
		},
		bindEvent:function(){
			var _this = this;
			// 红包的tab切换
			$('.hb_type li').on('click',function(){
				var hb_index = $(this).index();
				$(this).addClass('active').siblings().removeClass('active');
				_this.bindFlag = true;
				_this.params.status = hb_index;
				_this.params.page = 1;
				_this.renderData();	
			});
			$(document).on('click','.suress',function(){
				var hongbaoId = $(this).attr('data-id');
				G.showLoading();
				G.post(Service.useHongbao,{hongbao_id:hongbaoId},function(data){
					G.hideLoading();
					if(data.returnCode == '1'){
		                G.$alert(data.returnMsg,true,function(){ 
		                    window.location.reload();                
		                },true); 
					}else{
						G.$alert(data.returnMsg,false);
					}			
				});
			});
		}
	}
	return hongbao.init();
});

