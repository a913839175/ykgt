!function(m) {
    function i() {
        this.version = "1.0.0",
        this.base = ""
    }
    function n(m) {
        return function(i) {
            return {}.toString.call(i) == "[object " + m + "]"
        }
    }
    // document.write("<script src='http://cdn.mingsoft.net/plugins/validator/5.5.0/validator.js'></script>"),
    i.prototype.load = function(m) {
        seajs.config({
            // Sea.js 的基础路径
            // base: '/static/weipaidai/js/',
            // 别名配置
            alias: {
                'seajs-text': 'seajs/seajs-text.js',
                'jquery': 'lib/jquery/jquery.min.1.10.2.js',
                'WdatePicker': 'lib/WdatePicker/WdatePicker.js',
                'lazyload':'lib/lazyload/lazyload.js',
                'pagination': 'lib/jquery/jquery.pagination.js',
                'flexslider': 'lib/jquery/jquery.flexslider-min.js',
                'waypoint': 'lib/jquery/jquery.waypoints.min.js',
                'countUp': 'lib/jquery/jquery.countup.min.js',
                'select':'lib/jq.select.js',
                'selectFilter':'lib/selectFilter.js',
                'myslideup':'lib/myslideup.js',
                'MD5':'lib/jquery/jquery.md5.js',
                'Raphael': 'lib/raphael.js',
                'drag':'lib/drag/drag.js',
                'Clipboard':'lib/clipboard/clipboard.js',
                'kalendar':'lib/kalendar/kalendar.js',
                'JSEncrypt':'lib/JSEncrypt/JSEncrypt.js',
                'ImageLoad':'lib/ImageLoad/ImageLoad.js',
                //表单验证
                'Validform':'lib/Validform/Validform_v5.3.2.js',
                'passwordStrength':'lib/Validform/passwordStrength-min.js',
                'cookie':'lib/jquery/jquery.cookie.js',
                'tooltips':'lib/jquery/jquery.pure.tooltips.js',
                'EnPlaceholder':'lib/jquery/jquery.enplaceholder.js',
                'placeholder':"lib/jquery/jquery.placeholder.2.3.1",
                'jqForm':'lib/jquery/jquery.form.js',
                //https://cdn.bootcss.com/requirejs-handlebars/0.0.2/hbars.min.js
                'handlebars':'lib/handlebars/1.0.0/handlebars.js',
                'elementCreate':'lib/elementCreate.js',
                'Zoomify':'lib/zoomify/zoomify.js',
                'socialShare':'lib/share/share.js',
                //百度地图API
                'baidumap':'lib/baidumap/baidumap.js',
                //echars画图
                'echarts':'lib/echarts/echarts.min.js',
                //poshytip提示框
                'poshytip':'lib/poshytip/jquery.poshytip.min.js',
                'citydata':"lib/city-picker/city-picker.data.js",
                'citypicker':"lib/city-picker/city-picker.js",
                'avalon':'lib/avalon/avalon-2.2.8.js',
                //环形加载
                'svgCircle':'lib/svgCircle/svgCircle.js'
            },
            // 路径配置
            paths: {
                'tpl': '/templates',
                'public':'/public/static/js/act'
            },
            //版本号
            map: [
                 [ /^(.*\.(?:css|js|tpl))(.*)$/i, '$1?v=' + VERSION ]
            ],
            // 预加载项
            preload: ['seajs-text'],
            // 调试模式
            // debug: true,
            // 文件编码
            charset: 'utf-8'
        }),
        seajs.use(m);
    };
    m.ms = new i
}(window);
