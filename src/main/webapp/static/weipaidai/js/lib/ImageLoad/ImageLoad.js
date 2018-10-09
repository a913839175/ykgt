define(function(require, exports, module){
    var ImageLoad = function(){
        this.opts = {
           type: "h" 
        };  
        this.init();  
    };  
      
    ImageLoad.prototype = {  
        init : function () {  
            this.initImg(this.opts.type);  
        },  
        initImg : function(type) {  
            var _this = this;  
            var imgs = document.getElementsByTagName('img'); 
            for (var i=0; i<imgs.length; i++) {  
                try {  
                    var img = imgs[i];  
                    if ("w" == type) {  
                        $(img).onload = _this.setImgSize(img, _this.resetImgSizeW);  
                    } else if ("h" == type) {  
                        $(img).onload = _this.setImgSize(img, _this.resetImgSizeH);  
                    } else if ("wh" == type) {  
                        $(img).onload = _this.setImgSize(img, _this.resetImgSizeWH);  
                    }   
                } catch(e) {  
                }  
            }  
        },  
        //原始宽度 原始高度 容器宽度 容器高度  
        //保证高度一致  
        resetImgSizeH : function(img, nw, nh, w, h) {  
            nwh = nw / nh;  
            wh = w / h;  
            if (nwh > wh) {  
                img.height = h;  
                var width = parseInt(nwh * h);  
                img.width = width;  
                var left = parseInt((width - w) / 2) * -1;  
                img.style.marginLeft = left + "px";  
            } else if (nwh < wh) {  
                img.height = h;  
                var imgwidth = parseInt(nwh * h);  
                img.width = imgwidth;  
                var imgleft = parseInt((w - imgwidth) / 2);  
                img.style.marginLeft = imgleft + "px";  
            } else {  
                img.height = h;  
                img.width = w;  
            }  
        },  
        //原始宽度 原始高度 容器宽度 容器高度  
        //保证宽度一致  
        resetImgSizeW : function(img, nw, nh, w, h) {  
            nwh = nw / nh;  
            wh = w / h;  
            if (nwh > wh) {  
                img.width = w;  
                var height = parseInt(1 / nwh * w);  
                img.height = height;  
                var top = parseInt((h - height) / 2);  
                img.style.marginTop = top + "px";  
            } else if (nwh < wh) {  
                img.width = w;  
                var imgheight = parseInt(1 / nwh * w);  
                img.height = imgheight;  
                var imgtop = parseInt((imgheight - h) / 2) * -1;  
                img.style.marginTop = imgtop + "px";  
            } else {  
                img.height = h;  
                img.width = w;  
            }  
        },  
        //原始宽度 原始高度 容器宽度 容器高度  
        //铺满全屏  
        resetImgSizeWH : function(img, nw, nh, w, h) {  
            nwh = nw / nh;  
            wh = w / h;  
            if (nwh > wh) {  
                img.height = h;  
                var width = parseInt(nwh * h);  
                img.width = width;  
                var left = parseInt((width - w) / 2) * -1;  
                img.style.marginLeft = left + "px";  
            } else if (nwh < wh) {  
                img.width = w;  
                var height = parseInt(1 / nwh * w);  
                img.height = height;  
                var top = parseInt((height - h) / 2) * -1;  
                img.style.marginTop = top + "px";  
            } else {  
                img.height = h;  
                img.width = w;  
            }  
        },  
        //获取图片真实尺寸以及容器尺寸  
        setImgSize : function(img, callback) {  
            if (img.naturalWidth) { //html5  
                callback(img, img.naturalWidth, img.naturalHeight, img.width, img.height);  
            } else { // IE 6 7 8  
                var imgae = new Image();  
                image.src = img.src;  
                image.onload = function() {  
                    callback(img, image.width, image.height, img.width, img.height);  
                };  
            }  
        },  
    };
    return ImageLoad;
});  