// JavaScript Document
(function($) {
    $.fn.extend({
        "slideUp": function(value) {
            var docthis = this;
            //默认参数
            var ops = $.extend({
                "li_h": "60",
                "time": 3000,
                "movetime": 1000
            }, value);

            //向上滑动动画
            function autoani() {
                $("li:first", docthis).animate({
                    "margin-top": - ops.li_h
                }, ops.movetime, function() {
                    $(this).css("margin-top", 0).appendTo(".J-sline");
                });
            }
            //自动间隔时间向上滑动
            var anifun = setInterval(autoani, ops.time);
            //悬停时停止滑动，离开时继续执行
            $(docthis).children("li").hover(function() {
                clearInterval(anifun); //清除自动滑动动画
            }, function() {
                anifun = setInterval(autoani, ops.time); //继续执行动画
            });
        }
    });
})(jQuery);
