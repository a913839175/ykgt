/*
 * @Author:L.Tap
 * @Description: 社会化分享
 */
;
(function($, window, document, undefined) {
    //插件初始化
    function init(target, options) {
        var settings = $.extend({}, $.fn.socialShare.defaults, options);
		//初始化各个组件
        var $social_group = ""
		+ "<a target='_blank' title='分享到微信' class='msb_network_button weixin'></a>"
		+ "<a target='_blank' title='分享到新浪微博' class='msb_network_button sina'></a>"
		+ "<a target='_blank' title='分享到腾讯微博' class='msb_network_button tQQ'></a>"
		+ "<a target='_blank' title='分享到QQ空间' class='msb_network_button qZone'></a>"
		+ "<a target='_blank' title='复制链接' data-clipboard-action='copy' data-clipboard-target='#copyUrl' class='copy copy-btn'></a>";
		$(target).append($social_group);
        $(target).addClass("socialShare");

		//添加腾讯微博分享事件
		$(document).on("click",".msb_network_button.tQQ",function(){
			tQQ(this,settings);
		});
		//添加QQ空间分享事件
		$(document).on("click",".msb_network_button.qZone",function(){
			qZone(this,settings);
		});
		//添加新浪微博分享事件
		$(document).on("click",".msb_network_button.sina",function(){
			sinaWeibo(this,settings);
		});
		//添加豆瓣分享事件
		$(document).on("click",".msb_network_button.douban",function(){
			doubanShare(this,settings);
		});
		//添加微信分享事件
		$(document).on("click",".msb_network_button.weixin",function(){
			weixinShare(this,settings);
		});
		$(document).on("click",".mask",function(){
			$(this).remove();
		})
    }

	function replaceAPI (api,options) {
		// console.log(options)
		api = api.replace('{ewmurl}', options.ewmurl);
		api = api.replace('{url}', options.url);
		api = api.replace('{title}', options.title);
		api = api.replace('{content}', options.content);
		api = api.replace('{pic}', options.pic);

		return api;
	}

	function tQQ(target,options){
	    var options = $.extend({}, $.fn.socialShare.defaults, options);
		window.open(replaceAPI(tqq,options));
	}

	function qZone(target,options){
		var options = $.extend({}, $.fn.socialShare.defaults, options);
		window.open(replaceAPI(qzone,options));
	}

	function sinaWeibo(target,options){
		var options = $.extend({}, $.fn.socialShare.defaults, options);
		window.open(replaceAPI(sina,options));
	}

	function weixinShare(target,options){
		var ewmUrl = replaceAPI(weixin,$.extend({},$.fn.socialShare.defaults,options));
		var winBox = $('<div class="mask" id="J_wxewm">'+
        '<div class="pop_wxewm" style="width:300px;height:300px;position:absolute;top:50%;left:50%;margin-left:-150px;margin-top:-150px;cursor:pointer;">'+
        	'<img src='+ewmUrl+'>'+
        '</div>'+
        '</div>');
    	winBox.appendTo("body");
		// window.open(replaceAPI(weixin,$.extend({},$.fn.socialShare.defaults,options)));
	}

    $.fn.socialShare = function(options, param) {
        if(typeof options == 'string'){
		    var method = $.fn.socialShare.methods[options];
			if(method)
				return method(this,param);
		}else
			init(this,options);
    }


    //插件默认参数
    $.fn.socialShare.defaults = {
    	title: document.title,
        url: window.location.href,
        content: '',
        pic: ''
    }

	//插件方法
	$.fn.socialShare.methods = {
		//初始化方法
		init:function(jq,options){
			return jq.each(function(){
				init(this,options);
			});
		},
		tQQ:function(jq,options){
			return jq.each(function(){
				tQQ(this,options);
			})
		},
		qZone:function(jq,options){
			return jq.each(function(){
				qZone(this,options);
			})
		},
		sinaWeibo:function(jq,options) {
			return jq.each(function(){
				sinaWeibo(this,options);
			});
		},
		weixinShare:function(jq,options){
		    return jq.each(function(){
				weixinShare(this,options);
			});
	    }
	}


	//分享地址
	var qzone = 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url={url}&title={title}&pics={pic}&summary={content}';
	var sina = 'http://service.weibo.com/share/share.php?url={url}&title={content}&pic={pic}&appkey=1343713053&searchPic=false';
	var tqq = 'http://share.v.t.qq.com/index.php?c=share&a=index&url={url}&title={title}&appkey=801cf76d3cfc44ada52ec13114e84a96';
	var weixin = '{ewmurl}';


})(jQuery, window, document);