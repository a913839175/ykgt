define(function(require, exports, module){
	exports.init = function() {
		G.post(Service.get_cash_refresh_data,{},function(data){
			$(".bankimg").attr("src",'/static/weipaidai/images/bank/'+ data.bank_url);
			$('.cardno').html(data.card_no_end.substr(data.card_no_end.length-4))
		});
	};
    exports.init();
});