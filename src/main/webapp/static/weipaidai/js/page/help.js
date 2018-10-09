define(function(require, exports, module){
	// 点击减号的隐藏显示
	$('.wentip1').on('click',function(){
		var type = $(this).attr('data-type');
		if(type == 1){
			$(this).find('.wentip1img').addClass('wentip1imgactive');
			$(this).attr('data-type',2); 
			$(this).parents('.wentili').find('.wentip2').hide();
		}else if(type == 2){
			$(this).find('.wentip1img').removeClass('wentip1imgactive');
			$(this).attr('data-type',1); 
			$(this).parents('.wentili').find('.wentip2').show();
		}
	});
});

