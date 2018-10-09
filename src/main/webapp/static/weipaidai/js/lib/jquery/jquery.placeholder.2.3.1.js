// placeholder兼容使用
var placeholder = {
    add: function (el) {
        if (!('placeholder' in document.createElement('input'))) {
            var self = placeholder;
            el.each(function () {
                var e = $(this);
                if (!e.val() || e.val() == e.attr('placeholder')) {
                    e.val(e.attr('placeholder'));
                    e.css('color', 'grey');
                }
                else {
                    e.css('color', 'black');
                }
            });
            el.bind('focus', self._onfocus);
            el.bind('click', self._onfocus);
            el.bind('blur', self._onblur);
            el.bind('keyup', self._onkeyup);
        }
    },
    remove: function (el) {
        if (!('placeholder' in document.createElement('input'))) {
            var self = placeholder;
            el.unbind('focus', self._onfocus);
            el.unbind('click', self._onfocus);
            el.unbind('blur', self._onblur);
        }
    },
    check: function (el) {
        if (!('placeholder' in document.createElement('input'))) {
            el.each(function () {
                var tar = $(this);
                if (!(tar.val())) {
                    tar.val(tar.attr('placeholder'));
                }
            });
        }
    },
    clear: function () {
        if (!('placeholder' in document.createElement('input'))) {
            $('input[type="text"]').each(function () {
                var el = $(this);
                if (el.val() == el.attr('placeholder')) {
                    el.val('');
                }
            });
            $('textarea').each(function (el) {
                if (el.value() == el.attr('placeholder')) {
                    el.value('');
                }
            });
        }
    },
    _onfocus: function () {
        placeholder._hidePlaceholder($(this), false);
        if ($(this).val() == $(this).attr('placeholder'))
            $(this).val('');
    },
    _onblur: function () {
        if (!($(this).val()) || $(this).val() == $(this).attr('placeholder')) {
            $(this).val($(this).attr('placeholder'));
            $(this).css('color', 'grey');
        }
        else {
            $(this).css('color', 'black');
        }
        if(!$(this).val){           
            placeholder._hidePlaceholder($(this), false);
        }else{
            placeholder._hidePlaceholder($(this), true);
        }
    },
    _onkeyup: function () {
        placeholder._hidePlaceholder($(this), false);
        if (!($(this).val())) {
            $(this).css('color', 'grey');
        }
        else {
            $(this).css('color', 'black');
        }
    },
    _hidePlaceholder : function($this, status){
        if(status){
            $this.siblings('.placehoder-tit').show();//用于显示代替该元素placehoder属性的标签
        }else{
            $this.siblings('.placehoder-tit').hide();//用于隐藏代替该元素placehoder属性的标签
        }
        
    }
};
$(document).ready(function(){
    //palcehodler 兼容显示
    placeholder.add($('input'));
    //密码placeholder ie8/9解决方式，用标签(定位)代替placeholder 
    // $(document).on('blur', 'input', function(){
    //     if(!$(this).val()){
    //         $(this).siblings('.placehoder-tit').show();//用于显示代替该元素placehoder属性的标签
    //     }else{
    //         $(this).siblings('.placehoder-tit').hide();//用于隐藏代替该元素placehoder属性的标签
    //     }
    // }).on('keyup, click, focus', 'input', function(){
    //     $(this).siblings('.placehoder-tit').hide();//用于隐藏代替该元素placehoder属性的标签
    // }).on('click', '.placehoder-tit', function(){
    //     $(this).hide();//用于隐藏代替该元素placehoder属性的标签
    //     $(this).siblings('input').focus();
    // });
});