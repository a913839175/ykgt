define(function(require, exports, module) {
 	var Handlebars = require('handlebars');
    var itemTpl = require('tpl/mall/mallmeta.tpl');
    G.post(Service.searchInit,{count:8},function(data){
    	var itemHtml = Handlebars.compile(itemTpl);
        $(".hotList").html(itemHtml(data)); 
    });
    $('.search-button').on('click',function(){
    	var header_search_input =$('.header-search-input').val();
    	var params = {
     		keywords:header_search_input
     	};
    	if(header_search_input){
			G.post(Service.searchProduct,params,function(data){
				if(data.returnCode == 1){
					window.location.href="/mall/productinfo/"+"sousuo=" +  encodeURI(header_search_input);
				}else{
					alert('您搜索的产品不存在！请重新输入');
    				return false;
				}
			});
    	}else{
    		alert('请搜索您需要搜索的产品');
    		return false;
    	}
    });
    $(document).on('click','.hotList a',function(){
        var header_search_input =$(this).html();
        var params = {
            keywords:header_search_input
        };
        G.post(Service.searchProduct,params,function(data){
            if(data.returnCode == 1){
                window.location.href="/mall/productinfo/"+"sousuo=" +  encodeURI(header_search_input);
            }else{
                alert('您搜索的产品不存在！请重新输入');
                return false;
            }
        });
    });
});