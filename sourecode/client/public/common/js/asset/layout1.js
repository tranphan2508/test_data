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
    return{
        initSideBar: function () {
            handleSidebarMenu();
        },
        init: function () {
            this.initSideBar();
        }
    };
}();