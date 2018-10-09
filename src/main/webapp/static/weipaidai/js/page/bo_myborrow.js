define(function(require, exports, module){
    var pagination = require('pagination');
    var Handlebars = require('handlebars');
    var itemTpl = require('tpl/myborrowerList.tpl');
    require('page/account_common.js');
    $('.tab-nav-item').on('click',function(){
        var index = $(this).index();
        $(this).addClass('active').siblings().removeClass('active');
    });
});