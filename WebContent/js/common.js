function addEvent(elem, event, handler) {
    elem.attachEvent ? elem.attachEvent("on" + event, handler) : elem.addEventListener(event, handler, false);
}

function share() {
    var share = document.getElementById("bdshare");
    var ta = document.createElement("script");
    ta.id = 'bdshare_js';
    ta.type = 'text/javascript';
    ta.setAttribute('data', 'type=button&amp;uid=0');
    var tb = document.createElement("script");
    tb.id = 'bdshell_js';
    tb.type = 'text/javascript';
    tb.src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date() / 3600000);
    share.appendChild(ta);
    share.appendChild(tb);
}

function scroller() {
    var $scroll = document.getElementById("scroll");
    if ($scroll) {
        addEvent(window, 'scroll', function(e) {
            var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
            if (scrollTop > 240) {
                $scroll.style.display = 'block';
            } else {
                $scroll.style.display = 'none';
            }
        });
        addEvent($scroll, 'click', function(e) {
            window.scroll(0, 0);
        });
    }
}

function switchElem() {
    var elem = document.getElementById('module').getElementsByTagName('p');
    if (elem) {
        var spans = document.getElementById('module').getElementsByTagName('span');
        var arr = [];
        for (var i = 0, len = spans.length; i < len; i++) {
            if (spans[i].className === 'trigger-show') {
                arr.push(spans[i]);
            }
        }
        var arrlen = arr.length;
        if (arrlen > 0) {
            for (var i = 0; i < arrlen; i++) {
                (function(j) {
                    addEvent(arr[j], 'click', function(e) {
                        elem[j].style.display = 'block';
                        arr[j].style.display = 'none';
                    });
                })(i);
            }
        }
    }
}
$(function(){
    var $container = $('.container');
    var container_w=$container.width();
    var $ad = $('#rightad');
    var $window = $(window);
    var window_w=$window.width();
    var $document = $(document);
    var isIE6 = !!(navigator.appVersion.indexOf("MSIE 6") > -1);
    if ($ad.length > 0) {
        var ad_top = $ad.offset().top;
		var ad_positon = $ad.position().top;
        var ad_height = $ad.height();
        var container_top = $container.offset().top;
        var container_height = $container.height();
        $window.scroll(function(){
            var scroll_top = $document.scrollTop();
            if(scroll_top+ad_height>container_top+container_height){
                $ad.css({'position': 'absolute','top':'','bottom':'15px'});
            }else if (scroll_top > ad_top){
                if(window_w<container_w){
                    $ad.css({'position': 'absolute', 'top': scroll_top- ad_top+ad_positon});
                }else{
                    if (isIE6) {
                        $ad.css({'position': 'absolute', 'top': scroll_top- ad_top+ad_positon});
                    } else {
                        $ad.css({'position': 'fixed', 'top': 0});
                    }
                }
            }else{
                $ad.css({'position': ''});
            }
        }).scroll();
        $window.resize(function(){
            container_height = $container.height();
            window_w = $window.width();
        });
    }
});