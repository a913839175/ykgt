(function (factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD
        define(['jquery'], factory);
    } else if (typeof exports === 'object') {
        // CommonJS
        factory(require('jquery'));
    } else {
        // Browser globals
        factory(jQuery);
    }
}(function ($) {
    "use strict";
    //配置参数
    var defaults = {
        selectCls:'.select',
        optionCls:'.select-option',
        callback: function(){}  //回调
    };
    $.fn.select = function(parameter,callback){
        if(typeof parameter == 'function'){//重载
            callback = parameter;
            parameter = {};
        }else{
            parameter = parameter || {};
            callback = callback || function(){};
        }
        var max_width = 0;
        var options = $.extend({},defaults,parameter);
        $(document).on('click','body',function(){ 
            $(options.selectCls).removeClass('is-open');
        });
        return this.each(function() {
            $(this).on('click', options.optionCls, function(e) {
                var parent = $(this).closest(options.selectCls);
                if(parent.find('ul>li').length == 0){
                    return false;
                }
                if (!parent.hasClass('is-open')) {
                    parent.addClass('is-open');
                    $('.select.is-open').not(parent).removeClass('is-open');          
                } else {
                    parent.removeClass('is-open');
                }
                e.stopPropagation();
            }).on('click', 'ul>li', function() {
                var parent = $(this).closest(options.selectCls);
                var account = $(this).attr('data-account');
                var apr = $(this).attr('data-apr');
                var stype = $(this).attr('data-stype');
                var id = $(this).attr('data-id');
                parent.removeClass('is-open').find('.select-option').text($(this).text());
                parent.find(options.optionCls).attr('data-account',account);
                parent.find(options.optionCls).attr('data-apr',apr);
                parent.find(options.optionCls).attr('data-stype',stype);
                parent.find(options.optionCls).attr('data-id',id);
                $(this).addClass('is-select').siblings().removeClass('is-select');
            });
        });
    }
}));