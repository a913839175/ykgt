define(function(require, exports, module){
	var pagination = require('pagination');
	var Handlebars = require('handlebars');
	var itemTpl = require('tpl/invest.tpl');
	var bindFlag = true;
	var App = function(){
        return {
        	params:{
        		stype:$('.stype').val(),
				sortType:5,
				page:1,
				epage:10
        	},
            //初始化入口
            init:function(){
                App.renderData();
                App.bindEvent();
            },
	        //初始化投资产品列表
            renderData:function(){
            	var _this = this;
              	G.get(Service.productborrowlist,App.params,function(data){	
					var itemHtml = Handlebars.compile(itemTpl);
				    $("#investcpul").html(itemHtml(data));
				    G.progress();
				    if(bindFlag){
				    	$('.M-box').pagination({
						    totalData:data.total,
						    showData:10,
						    coping:true,
						    callback:function(api){
						    	bindFlag = false;
						    	//再次渲染列表
						    	App.params.page = api.getCurrent()
						    	_this.renderData();
						    }
						});
				    }	    		
				});  
            },
            bindEvent:function(){
            	//排序
				$('.allobjecli').on('click',function(){
					var index = $(this).index();
					if(index==2){return false;}
					var sort = 'desc';
					if($(this).find('.allobjecliimg1').hasClass("allactive")){
						$(this).find('.allobjecliimg1').removeClass("allactive");
						sort = 'desc';
					}else{
						sort = 'asc';
						$(this).find('.allobjecliimg1').addClass("allactive");
					}
					App.params.sortDirect = sort;
					App.params.sortType = parseInt(index + 1);
					App.params.page = $('.M-box').find('span.active').html();
					bindFlag = false;
				    App.renderData();
				});
				$(window).scroll(function() {
					G.progress()
				});
            }
        };
    }();
    G.onReady(App);
});

