/*!
 * jQuery lightweight plugin boilerplate
 * Original author: @ajpiano
 * Further changes, comments: @addyosmani
 * Licensed under the MIT license
 */


// the semi-colon before the function invocation is a safety 
// net against concatenated scripts and/or other plugins 
// that are not closed properly.
;(function ( $, window, document, undefined ) {
    
    // undefined is used here as the undefined global 
    // variable in ECMAScript 3 and is mutable (i.e. it can 
    // be changed by someone else). undefined isn't really 
    // being passed in so we can ensure that its value is 
    // truly undefined. In ES5, undefined can no longer be 
    // modified.
    
    // window and document are passed through as local 
    // variables rather than as globals, because this (slightly) 
    // quickens the resolution process and can be more 
    // efficiently minified (especially when both are 
    // regularly referenced in your plugin).

    // Create the defaults once
    var pluginName = "foldAway",
        defaults = {
            propertyName: "value"
        };

    // The actual plugin constructor
    function foldAway( element, options ) {
        this.element = element;

        this.$win = $(window);

        // jQuery has an extend method that merges the 
        // contents of two or more objects, storing the 
        // result in the first object. The first object 
        // is generally empty because we don't want to alter 
        // the default options for future instances of the plugin
        this.options = $.extend( {}, defaults, options) ;
        
        this._defaults = defaults;
        this._name = foldAway;
        
        this.init();
    }

    foldAway.prototype.init = function () {
        // Place initialization logic here
        // You already have access to the DOM element and
        // the options via the instance, e.g. this.element 
        // and this.options
        this.timer;
        this.topY = $(window).scrollTop();

        this.$win.on({
            scroll : function () {
                clearTimeout(this.timer);
                this.timer = setTimeout("foldAway._open()", 250);
            },
            resize : function () {}
        });
    };

    foldAway.prototype._open = function () {
        console.log("SCROLL");
    };

    // A really lightweight plugin wrapper around the constructor, 
    // preventing against multiple instantiations
    $.fn[pluginName] = function ( options ) {
        return this.each(function () {
            if (!$.data(this, 'plugin_' + foldAway)) {
                $.data(this, 'plugin_' + foldAway, 
                new foldAway( this, options ));
            }
        });
    }

})( jQuery, window, document );





// (function ($) {

//     $.foldAway = function(options, el) {
//         this.$el = $(el);
//         this._init(options);
//     };

 
//     $.fn.foldAway = function(options) {

//         var pluginName, defaults;

//         // plugin name
//         pluginName = "foldAway",
//         // options
//         defaults = {
//             // delay speed
//             delay    : 250,
//             // element wrapper
//             wrapper  : ".header-content",
//             // debug utilities
//             debug    : false
//         };
         
//         // initialize default options
//         var options = $.extend(defaults, options);

//         var that = this;

//         return this.each(function() {

//             var $el  = $(this),
//                 $win = $(window);



//             // core functions
//             function _open () {
//                 $el.find(defaults.wrapper).css("background", "red");
//             };
//             function _close () {};
//             function _destroy () {};
//             function _debug () {};

//             $win.on({
//                 scroll : function () {
//                     console.log("woooo");
//                     _open();
//                     // Tooltip debug
//                     // if (defaults.debug == true && window.console) {
//                         // console.log(stuff)
//                     // }

//                 }
//                 // resize : function () {}
//             });
     
//         });

//     };

// })(jQuery);