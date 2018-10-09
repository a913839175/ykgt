define(function(require, exports, module){
	require('tooltips');
	var pagination = require('pagination');
	var Handlebars = require('handlebars');
	var itemTpl = require('tpl/messageList.tpl');
	require('page/account_common.js');
	var message = {
		params : {
			page:1,
			epage:10  
		},
		bindFlag:true,
		init:function(){
			this.renderData();
			this.bindEvent();
		},
		renderData:function(){
			var _this = this;
			G.get(Service.messageList,_this.params,function(data){
				var itemHtml = Handlebars.compile(itemTpl);
			    $(".message-box").html(itemHtml(data));
			    $('.tooltips').each(function(k,item){
			    	$(item).pt({
					    position: 'r', // 默认属性值
					    align: 'c',	   // 默认属性值
					    width:'auto',
					    time:'1000',
					    content: $(item).attr('data-title')
					});
			    })
			    if(_this.bindFlag){
			    	if(data.total){
			    		$('.M-box').show();
			    	}else{
			    		$('.M-box').hide();
			    	}
			    	$('.M-box').pagination({
					    totalData:data.total,
					    showData:10,
					    coping:true,
					    callback:function(api){
					    	_this.bindFlag = false;
					    	//再次渲染列表
					    	_this.params.page = api.getCurrent()
					    	_this.renderData();
					    }
					});
			    }	    		
			});
		},
		bindEvent:function(){
			var _this = this;
			//全部已读
			$(document).on('click','.readmsg',function(){
				G.get(Service.readallMessage,{
					userSource: 'B0001'
				},function(data){
					if(data.returnCode == 1){
		               $('.readall_icon').hide();
		               window.location.reload()		    
					}
					
				})
			})
			$(document).on('click','.td-list',function(){
				var id = $(this).attr('data-id');
				var self = $(this)
				if(self.attr('data-status') == '未读'){
					G.get(Service.read_one_message,{
						userSource: 'B0001',
						message_id:id
					},function(data){
						if(data.returnCode == 1){
							self.attr("data-status","已读")
							self.find('.message').removeClass('message-icon').addClass('message-icon1');
							G.get(Service.messageList,params,function(data){
								if(data.total_no_read == 0){
									 $('.readall_icon').hide();
								}
							});
						}
					})
				}
			})
		}
	}
	return message.init()
});