﻿$(function () {
    $.fn.cookie = function (name, value, options) {
        if (typeof value != 'undefined') { // name and value given, set cookie 
            options = options || {};
            if (value === null) {
                value = '';
                options.expires = -1;
            }
            var expires = '';
            if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
                var date;
                if (typeof options.expires == 'number') {
                    date = new Date();
                    date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
                } else {
                    date = options.expires;
                }
                expires = '; expires=' + date.toGMTString(); // use expires attribute, max-age is not supported by IE 
            }
            var path = options.path ? '; path=' + options.path : '';
            var domain = options.domain ? '; domain=' + options.domain : '';
            var secure = options.secure ? '; secure' : '';
            document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure, ';'].join('');
        } else { // only name given, get cookie 
            var cookieValue = null;
            if (document.cookie && document.cookie != '') {
                var cookies = document.cookie.split(';');
                for (var i = 0; i < cookies.length; i++) {
                    var cookie = jQuery.trim(cookies[i]);
                    // Does this cookie string begin with the name we want? 
                    if (cookie.substring(0, name.length + 1) == (name + '=')) {
                        cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                        break;
                    }
                }
            }
            return cookieValue;
        }
    };


    var pageContent = $(".article-con"), currentFont = 1, current_fimaly = 0;
    var saveFont = $.fn.cookie("current-font"), saveFimaly = $.fn.cookie("current-fimaly");
    var font = function () {
        var sizes = ["14px", "16px", "18px", "20px", "22px", "26px"], line_height = ["24px", "28px", "32px", "36px", "40px", "50px"], level = sizes.length;
        var fimaly = ["SimSun", "SimHei", "Microsoft YaHei", "KaiTi"];
        return {
            set: function (c) {
                pageContent.css({ fontSize: sizes[c], lineHeight: line_height[c] });
                currentFont = c;
                var $li = $("li.font-size a");
                $li.removeClass("current").eq(c).addClass("current");
                $.fn.cookie("current-font", c, { expires: 3600, path: "/" });
            },
            set_fimaly: function () {
                if (current_fimaly < line_height.length) {
                    this.set(currentFont);
                }
                pageContent.css({ fontFamily: fimaly[current_fimaly] });
                var $li = $("li.font-family a");
                $li.removeClass("current").eq(current_fimaly).addClass("current");
                $.fn.cookie("current-fimaly", current_fimaly, { expires: 3600, path: "/" });
            },
            increase: function () {
                if (currentFont < level) {
                    this.set(currentFont);
                }
            },
            init: function () {
                if (typeof saveFont !== "undefined") {
                    saveFont = saveFont == null ? 1 : saveFont;
                    font.set(saveFont);
                }

                if (typeof saveFimaly !== "undefined") {
                    current_fimaly = saveFimaly == null ? 0 : parseInt(saveFimaly);
                    font.set_fimaly();
                }
            }
        };
    }();

    font.init();

    $("li.font-size a").click(function () {
        currentFont = $("li.font-size a").index($(this));
        font.increase();
    });

    $("li.font-family a").click(function () {
        current_fimaly = $("li.font-family a").index($(this));
        font.set_fimaly();
    });

    $("a.default").click(function () {
        currentFont = 2;
        font.increase();
        current_fimaly = 0;
        font.set_fimaly();
    });
});

$(document).bind("contextmenu", function (e) { return false; });
$(document).keydown(function (e) {
    if (window.event != null) {
        e = event;
    }
    var kc = e.keyCode;
    var url = "";
    if (kc == 13) {
        url = "chapter.html";
    } else if (kc == 37) {
        url = _book.PrevPage;
    } else if (kc == 39) {
        url = _book.NextPage;
    }
    if (url != "") {
        window.location.href = url;
    }
});

scriptDomElement('/services/member.aspx?action=bookcase&bid=' + _book.id + "&cid=" + _book.chapterid + "&s=" + Math.random());