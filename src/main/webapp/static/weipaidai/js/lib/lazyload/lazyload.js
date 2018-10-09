(function (global, factory) {
    typeof exports === 'object' && typeof module !== 'undefined' ? module.exports = factory() : typeof define === 'function' && define.amd ? define(factory) : global.lazyload = factory();
})(this, function () {
  'use strict';

  var lazyload = {};

  var callback = function () {};

  var offset, poll, delay, useDebounce, unload;

  var isHidden = function (element) {
    return (element.offsetParent === null);
  };
  
  var inView = function (element, view) {
    if (isHidden(element)) {
      return false;
    }

    var box = element.getBoundingClientRect();
    return (box.right >= view.l && box.bottom >= view.t && box.left <= view.r && box.top <= view.b);
  };
  var hasClass = function (elem, cls) {
    cls = cls || '';
    if (cls.replace(/\s/g, '').length == 0) return false; //当cls没有参数时，返回false
    return new RegExp(' ' + cls + ' ').test(' ' + elem.className + ' ');
  };
 
  var addClass = function (elem, cls) {
    if (!hasClass(elem, cls)) {
      elem.className = elem.className == '' ? cls : elem.className + ' ' + cls;
    }
  };
  var removeClass = function (elem, cls) {
    if (hasClass(elem, cls)) {
      var newClass = ' ' + elem.className.replace(/[\t\r\n]/g, '') + ' ';
      while (newClass.indexOf(' ' + cls + ' ') >= 0) {
        newClass = newClass.replace(' ' + cls + ' ', ' ');
      }
      elem.className = newClass.replace(/^\s+|\s+$/g, '');
    }
  };
  if (!document.querySelectorAll) {
      document.querySelectorAll = function (selectors) {
          var style = document.createElement('style'), elements = [], element;
          document.documentElement.firstChild.appendChild(style);
          document._qsa = [];

          style.styleSheet.cssText = selectors + '{x-qsa:expression(document._qsa && document._qsa.push(this))}';
          window.scrollBy(0, 0);
          style.parentNode.removeChild(style);

          while (document._qsa.length) {
              element = document._qsa.shift();
              element.style.removeAttribute('x-qsa');
              elements.push(element);
          }
          document._qsa = null;
          return elements;
      };
  }

  if (!document.querySelector) {
      document.querySelector = function (selectors) {
          var elements = document.querySelectorAll(selectors);
          return (elements.length) ? elements[0] : null;
      };
  }
  var debounceOrThrottle = function () {
    if(!useDebounce && !!poll) {
      return;
    }
    clearTimeout(poll);
    poll = setTimeout(function(){
      lazyload.render();
      poll = null;
    }, delay);
  };

  lazyload.init = function (opts) {
    opts = opts || {};
    var offsetAll = opts.offset || 100;
    var throttle = opts.throttle || 250;
    var offsetVertical = opts.offsetVertical || offsetAll;
    var offsetHorizontal = opts.offsetHorizontal || offsetAll;
    var optionToInt = function (opt, fallback) {
      return parseInt(opt || fallback, 10);
    };
    offset = {
      t: optionToInt(opts.offsetTop, offsetVertical),
      b: optionToInt(opts.offsetBottom, offsetVertical),
      l: optionToInt(opts.offsetLeft, offsetHorizontal),
      r: optionToInt(opts.offsetRight, offsetHorizontal)
    };
    delay = optionToInt(throttle, 250);
    useDebounce = opts.debounce !== false;
    unload = !!opts.unload;
    callback = opts.callback || callback;
    lazyload.render();
    if (document.addEventListener) {
      window.addEventListener('scroll', debounceOrThrottle, false);
      window.addEventListener('load', debounceOrThrottle, false);
    } else {
      window.attachEvent('onscroll', debounceOrThrottle);
      window.attachEvent('onload', debounceOrThrottle);
    }
  };

  lazyload.render = function (context) {
    var nodes = (context || document).querySelectorAll('[data-src], [data-background]');
    var length = nodes.length;
    var src, elem;
    var view = {
      l: 0 - offset.l,
      t: 0 - offset.t,
      b: (window.innerHeight || document.documentElement.clientHeight) + offset.b,
      r: (window.innerWidth || document.documentElement.clientWidth) + offset.r
    };
    for (var i = 0; i < length; i++) {
      elem = nodes[i];
      if (inView(elem, view)) {

        if (unload) {
          elem.setAttribute('data-placeholder', elem.src);
        }

        if (elem.getAttribute('data-background') !== null) {
          elem.style.backgroundImage = 'url(' + elem.getAttribute('data-background') + ')';
        }
        else if (elem.src !== (src = elem.getAttribute('data-src'))) {
          elem.src = src;
        }

        if (!unload) {
          elem.removeAttribute('data-src');
          removeClass(elem,'lazyloading');
          elem.removeAttribute('data-background');
        }

        callback(elem, 'load');
      }
      else if (unload && !!(src = elem.getAttribute('data-placeholder'))) {

        if (elem.getAttribute('data-background') !== null) {
          elem.style.backgroundImage = 'url(' + src + ')';
        }
        else {
          elem.src = src;       
        }

        elem.removeAttribute('data-placeholder');
        callback(elem, 'unload');
      }
    }
    if (!length) {
      lazyload.detach();
    }
  };

  lazyload.detach = function () {
    if (document.removeEventListener) {
      window.removeEventListener('scroll', debounceOrThrottle);
    } else {
      window.detachEvent('onscroll', debounceOrThrottle);
    }
    clearTimeout(poll);
  };

  return lazyload;

});