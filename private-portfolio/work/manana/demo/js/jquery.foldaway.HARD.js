(function ($) {

    $.foldAway = function(options, el) {
        this.$el = $(el);
        this._init(options);
    };

    // options
    $.foldAway.defaults = {
        // delay speed
        delay   : 500,
        // element wrapper
        wrapper : ".header-content",
        // debug utilities
        debug   : false
    };

    $.fn.foldAway.prototype = {
        _init : function( options ) {
            // options
            this.options = $.extend(true, {}, $.foldAway.defaults, options);
            // cache some elements and initialize some variables
            this._config();
            // initialize/bind the events
            this._initEvents();
        },
        _config : function() {
            // stuff
        },
        _initEvents : function() {
            // stuff
            var that = this;
            this.$win.on({
                scroll : function () {},
                resize : function () {}
            });
        },
        _open : function () {},
        _close : function () {},
        _destroy : function () {}
        _debug : function () {}
    };
 
    var logError = function(message) {
        if (window.console) {
            window.console.error(message);
        }
    };
 
    $.fn.foldAway = function(options) {
        var options = $.extend(defaults, options);
     
        return this.each(function() {  
            var instance = $.data(this, "foldAway");
            if (instance) {
                instance._init();
            }
            else {
                instance = $.data(this, "foldAway", new $.foldAway(options, this));
            }
        });

        // return this;
    };

})(jQuery, window);