var Layout = function () {

    var scrollTo = function (el, offeset) {
        var pos = (el && el.size() > 0) ? el.offset().top : 0;

        if (el) {
            pos = pos + (offeset ? offeset : -1 * el.height());
        }

        $('html,body').animate({
            scrollTop: pos
        }, 'slow');
    };

    // Handle sidebar menu
    var handleSidebarMenu = function () {
        $('body').on('click', '.page-sidebar li > a', function (e) {
            var hasSubMenu = $(this).next().hasClass('sub-menu');
            if (hasSubMenu == false) {
                return;
            }

            var menu = $('.page-sidebar-menu');
            var sub = $(this).next();
            var the = $(this);

            var slideSpeed = parseInt(menu.data("slide-speed"));

            var slideOffeset = -200;
            if (sub.is(":visible")) {
                $('.arrow', $(this)).removeClass("open");
                $(this).parent().removeClass("open");
                sub.slideUp(slideSpeed, function () {
                    scrollTo(the, slideOffeset);
                });
            } else {
                $('.arrow', $(this)).addClass("open");
                $(this).parent().addClass("open");
                sub.slideDown(slideSpeed, function () {
                    scrollTo(the, slideOffeset);
                });
            }
            e.preventDefault();
        });
    };

    var handleSidebarToggler = function () {
        var body = $('body');
        if ($.cookie && $.cookie('sidebar_closed') === '1') {
            $('body').addClass('page-sidebar-closed');
            $('.page-sidebar-menu').addClass('page-sidebar-menu-closed');
        }

        // handle sidebar show/hide
        $('body').on('click', '.sidebar-toggler', function (e) {
            var sidebar = $('.page-sidebar');
            var sidebarMenu = $('.page-sidebar-menu');
            $(".sidebar-search", sidebar).removeClass("open");

            if (body.hasClass("page-sidebar-closed")) {
                body.removeClass("page-sidebar-closed");
                sidebarMenu.removeClass("page-sidebar-menu-closed");
                if ($.cookie) {
                    $.cookie('sidebar_closed', '0');
                }
            } else {
                body.addClass("page-sidebar-closed");
                sidebarMenu.addClass("page-sidebar-menu-closed");
                if (body.hasClass("page-sidebar-fixed")) {
                    sidebarMenu.trigger("mouseleave");
                }
                if ($.cookie) {
                    $.cookie('sidebar_closed', '1');
                }
            }

            //$(window).trigger('resize');
        });
    };
    return{
        initSideBar: function () {
            handleSidebarToggler();
            handleSidebarMenu();
        },
        init: function () {
            this.initSideBar();
        }
    };
}();