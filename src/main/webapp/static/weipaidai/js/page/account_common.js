define(function(require, exports, module) {
	exports.init = function() {
		// 账户left的hover效果 开始
		$('.statusnew-li').on('mouseover', function() {
			$('.statusnew-li').find('.xstatus-p').hide();
			$('.statusnew-li').find('.xstatus-n').hide();
			$(this).find('.xstatus-p').show();
			$(this).find('.xstatus-n').show();
		});
		$('.statusnew-li').on('mouseout', function() {
			$('.statusnew-li').find('.xstatus-p').hide();
			$('.statusnew-li').find('.xstatus-n').hide();
		});
		
	    // 账户left的hover效果 结束
	    $(document).on("click","#J_refresh",function(){
	    	window.location.reload();
	    });
    };
    exports.init();
});