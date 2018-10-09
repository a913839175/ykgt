define(function(require, exports, module){
	var pagination = require('pagination');
	var Handlebars = require('handlebars');
	var itemTpl = require('tpl/myinvestList.tpl');
	var itemTpl2 = require('tpl/myloanList.tpl');
	require('page/account_common.js');
	var flag = 0; 
	var params = {
		page:1,
		epage:5,
		status:3
	};
	var bindFlag = true;
	var renderData = function(params){		
		G.get(Service.myinvestList,params,function(data){
			// console.log(data)
			$.each(data.lists,function(k,item){
				item.status = params.status;
			});
			var itemHtml = Handlebars.compile(itemTpl);
		    $("#myinvestList").html(itemHtml(data));
		    if(bindFlag){
		    	if(data.total){
		    		$('.M-box').show();
		    	}else{
		    		$('.M-box').hide();
		    	}
		    	$('.M-box').pagination({
				    totalData:data.total,
				    showData:5,
				    coping:true,
				    callback:function(api){
				    	bindFlag = false;
				    	//再次渲染列表
				    	params.page = api.getCurrent();
				    	renderData(params);
				    }
				});
		    }	    		
		});
	};
	renderData(params);
	var renderList = function(borrowNid){
		G.get(Service.myloanList,{p_id: borrowNid},function(data){
			if(data.lists){
				$.each(data.lists,function(k,v){
					if(v.contract_name){
						v.contract_name = G.imagesURl +'/pdf/'+ v.contract_name;
					}			
				});
				$('#J_myinvest_box').show();
				var itemHtml = Handlebars.compile(itemTpl2);
		    	$("#poptdList").html(itemHtml(data));
			}			
		});
	};
	$('.tab-nav-item').on('click',function(){
		var index = $(this).index();
		$(this).addClass('active').siblings().removeClass('active');
		bindFlag = true;
		if(index == 0){
			params.status = 3;
		}else if(index == 1){
			params.status = 1;
		}else if(index == 2){
			params.status = 2;
		}	
		renderData(params);
	});
	$(document).on('click','.datil',function(){	
    	var borrowNid = $(this).attr('data-id');
    	renderList(borrowNid);
    	$("body").css('overflow','hidden');	
    });
	$(document).on('click','#pop_box_close',function(){	
    	$('#J_myinvest_box').hide();
    	$("body").css('overflow','scroll');	
    });
});