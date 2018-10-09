define(function(require, exports, module){
    var Handlebars = require('handlebars');
    var itemTpl = require('tpl/mall/wbrecord.tpl');
    var pagination = require('pagination');
    require('mall/mallmeta');
    var  params = {
       user_id:$('#userid').val(),
       page:"1",
       epage:"10",
       type:"0"
    };
    var bindFlag1 = true;
    function renderData (){
       G.post(Service.cList, params, function(data){
            if(data.returnCode == 1){
              $.each(data.lists,function(k,v){
                 v.addtime1 = G.formatTime(parseInt(v.addtime * 1000),"yyyy-MM-dd");
              });
              var itemHtml = Handlebars.compile(itemTpl);
              $("#wbtbody").html(itemHtml(data)); 
              if(bindFlag1){
                  $('.M-box1').pagination({
                      totalData:data.total,
                      showData:10,
                      coping:true,
                      callback:function(api){
                          bindFlag1 = false;
                          //再次渲染列表
                          params.page = api.getCurrent();
                          renderData(params);
                      }
                  });
              }            
            }
       });
    } 
    renderData();
    $('.tecontant_li').on('click',function(){
        index = $(this).index();
        $(this).addClass('tecontant_liactive').siblings().removeClass('tecontant_liactive');
        params.page = 1;
        params.type = index;
        bindFlag1 = true;
        renderData(params);
    });
});