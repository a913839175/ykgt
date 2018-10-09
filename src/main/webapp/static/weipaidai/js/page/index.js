define(function(require, exports, module){
	var flexslider = require("flexslider");
	var	countUp = require("countUp");
	var	Lazyload = require('lazyload');
	var	Raphael = require("Raphael");
	var	myslideup = require("myslideup");
	var	svgCircle = require("svgCircle");
	function Mod() {
		this.init();
	}
	Mod.prototype = {
		init:function(){
			this.plugInit();
			this.bindEvent();
		},
		plugInit:function(){
			//进度条加载
			G.progress();
			//图片懒加载
			lazyload.init();
			//首页banner轮播
			$('.flexslider').flexslider({
				directionNav: false, //是否显示左右方向箭头按钮
				pauseOnAction: false, //是否显示左右方向箭头按钮
				animationSpeed: 1000, //动画时间
				slideshowSpeed: 4000 //停留时间
			});
			//数字动画	
			$('.counter').countUp({
			    delay: 10,
			    time: 1500
			});
			//文字滚动
			$(".J-sline").slideUp();
		},
		bindEvent:function(){
			$(window).scroll(function() {
				G.progress()
			});
		}
	}
	new Mod();
});

