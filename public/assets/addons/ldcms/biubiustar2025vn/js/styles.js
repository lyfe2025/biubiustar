$(function () {
    new WOW({
        boxClass: "wow",
        animateClass: "animated",
        offset: 0,
        mobile: true,
        live: true,
    }).init();

    // 初始化 Swiper
    new Swiper(".banner-pc", {
        loop: true,
        autoplay: {
            delay: 5000,
        },
        effect: "fade",
        pagination: {
            el: ".banner-pc .swiper-pagination",
            type: "bullets",
            clickable: true,
        },
        navigation: {
            nextEl: "#main-slider__swiper-button-next",
            prevEl: "#main-slider__swiper-button-prev",
        },
    });

    new Swiper(".case-swiper", {
        slidesPerView: 4,
        spaceBetween: 30,
        loop: true,
        navigation: {
            nextEl: ".case-next",
            prevEl: ".case-prev",
        },
        pagination: {
            el: ".case-wrapper .swiper-pagination",
        },
        loopFillGroupWithBlank: true,
        breakpoints: {
            320: {
                //当屏幕宽度大于等于320
                slidesPerView: 1,
                spaceBetween: 10,
            },
            768: {
                //当屏幕宽度大于等于768
                slidesPerView: 1,
                spaceBetween: 20,
            },
            1024: {
                //当屏幕宽度大于等于1024
                slidesPerView: 2,
                spaceBetween: 30,
            },
            1280: {
                //当屏幕宽度大于等于1280
                slidesPerView: 3,
                spaceBetween: 30,
            },
            2560: {
                //当屏幕宽度大于等于1280
                slidesPerView: 4,
                spaceBetween: 30,
            },
        },
    });

    $(".menu > ul > li:has( > .sub-menu)").addClass("menu-dropdown-icon");
    $(".menu > ul > li > ul:not(:has(.sub-menu))").addClass("normal-sub");
    // 拆分 hover 事件为 mouseenter/mouseleave
    $(".menu > ul > li").on('mouseenter', function (e) {
        if ($(window).width() > 943) {
            $(this).children(".sub-menu").stop(true, true).fadeIn(150);
            $(this).addClass("rotate-icon");
        }
    }).on('mouseleave', function (e) {
        if ($(window).width() > 943) {
            $(this).children(".sub-menu").stop(true, true).fadeOut(150);
            $(this).removeClass("rotate-icon");
        }
    });
    $(".menu > ul > li").on('click', function (e) {
        if ($(window).width() <= 943) {
            // 如果点击的是子菜单链接，直接返回
            if ($(e.target).closest('.sub-menu-item a').length) {
                return;
            }
            // 如果没有子菜单且点击的是链接，直接跳转
            if (!$(this).hasClass('menu-dropdown-icon') && $(e.target).is('a')) {
                return;
            }

            $(this).children(".sub-menu").fadeToggle(50);
            $(this).toggleClass("rotate-icon");
            e.preventDefault();
        }
    });
    $(".menu-mobile").on('click', function (e) {
        $(".menu > ul").toggleClass("show-on-mobile");
        $(this).toggleClass("open");
        e.preventDefault();
    });

    $(".count-wrapper .number").countUp();
    $(".search-icon").on('click', function () {
        $(".search-wrapper").addClass("show");
    })
    $(".search-close").on('click', function () {
        $(".search-wrapper").removeClass("show");
    })

    $(".qrcode_ewm").on('click', function () {
        // 在此处输入 layer 的任意代码
        layer.open({
            type: 1,
            closeBtn: 0,
            skin: "layui-layer-lan",
            title: "微信分享扫描二维码",
            shadeClose: true, // 点击遮罩关闭层
            content: $("#qrcode"), // 捕获的元素
            end: function () {
                $(".qrcode_ewmimg").css("display", "none");
            },
        });
    });

    //分享到微信的二维码
    var path = window.location.href;
    $("#qrcode").qrcode({
        text: path, //设置二维码内容
        render: "table", //设置渲染方式
        width: 256, //设置宽度,默认生成的二维码大小是 256×256
        height: 256, //设置高度
        typeNumber: -1, //计算模式
        background: "#ffffff", //背景颜色
        foreground: "#000000", //前景颜色
    });
    //2.分享到微博，空间
    //新浪微博分享部分
    var ShareTip = function () { };
    //分享到腾讯微博
    ShareTip.prototype.sharetoqq = function (content, url, picurl) {
        var shareqqstring = "http://share.v.t.qq.com/index.php?title=" + content + "&url=" + url + "&pic=" + picurl;
        window.open(shareqqstring);
    };
    //分享到新浪微博
    ShareTip.prototype.sharetosina = function (title, url, picurl) {
        var sharesinastring = "http://service.weibo.com/share/share.php?title=" + title + "&url=" + url + "&content=utf-8&sourceUrl=" + url + "&pic=" + picurl;
        window.open(sharesinastring);
    };
    //分享到QQ空间
    ShareTip.prototype.sharetoqqzone = function (title, url, picurl) {
        var shareqqzonestring = "http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?summary=" + title + "&url=" + url + "&pics=" + picurl;
        window.open(shareqqzonestring);
    };
    $(".a-weibo").on('click', function () {
        var share1 = new ShareTip();
        var title = $(this).data("title");
        share1.sharetosina(title, window.location.href, "");
    });

    $("#gttop").on('click', function () {
        // 暂时禁用原生的平滑滚动，避免与jQuery动画冲突
        $('html').css('scroll-behavior', 'auto');
        $("body,html").stop().animate({ scrollTop: 0 }, 800, function () {
            // 动画结束后恢复设置
            $('html').css('scroll-behavior', '');
        });
        return false;
    });
});