// Simple wrapper a-la-jquery
// var $ = function (el) { return document.querySelector(el); };


// Base Animations
// A simple object/table that defines which kind of
// animations are available
var anims = {
    getDrawer : ["getDrawerIn" , "getDrawerOut" ],
    delDrawer : ["delDrawerIn" , "delDrawerOut" ],
    moveLeft  : ["moveLeftIn"  , "moveLeftOut"  ],
    moveRight : ["moveRightIn" , "moveRightOut" ],
    pushUp    : ["pushUpIn"    , "pushUpOut"    ],
    pushDown  : ["pushDownIn"  , "pushDownOut"  ],
    slideDown : ["slideDownIn" , "slideDownOut" ]
};


// UIChange
// ---
// handles the various views, should/can be
// integrated with some content injection
// ---
// viewIn   : what view comes in, gives the new context
// viewOut  : what view fades out
// anim     : which kind of animation we want
// callback : is possible to run a callback after viewIn
//            comes in and viewOut fades out
// ---
var UIChange = function (viewIn, viewOut, anim, callback) {
    var viewIn  = $(viewIn),
        viewOut = $(viewOut),
        vendorAnimationEnd = "animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd",
        afterAnimEnds = function () {
            // console.log("@@@", viewIn, viewOut)
            viewOut.addClass("hidden");

            viewIn.removeClass(anims[anim][0]);
            viewOut.removeClass(anims[anim][1]);

            viewOut.off(vendorAnimationEnd, afterAnimEnds);
        };

    viewOut.on(vendorAnimationEnd, afterAnimEnds);

    viewIn.removeClass("hidden");
    viewIn.find(".scroll").scrollTop(0);

    if (typeof(callback) == "function") {
        callback(viewIn);
        // window.setTimeout(callback, 50, viewIn)
    }

    // console.log(">>>", viewIn, viewOut, anims[anim][0], anims[anim][1])

    viewIn.addClass(anims[anim][0]);
    viewOut.addClass(anims[anim][1]);
};

var doUIChange = function (e, anim, callback) {
    var viewIn  = $(e.target).closest("a").attr("href");
    var viewOut = "#" + $(e.target).closest(".view").attr("id");
    // var anim = (anim == undefined) ? anim : "moveLeft";
    var anim = anim || "moveLeft";

    UIChange(viewIn, viewOut, anim, callback);

    e.preventDefault();
}

var newStuffView = function (context) {
    var context = context || "body";

    context.find("form").css("background", "red");
    context.find("form textarea").trigger("click");
    context.find("form textarea").prop("autofocus", true);
    // context.find("form textarea").focus();
    console.log("FIRED", "from:", context);
}

var dummyCallback = function () {
    alert("CALLBACK!!!11!1!!1!!!")
}

// Load a certain view, useful for debugging, possible routing
$(document).ready(function(){
    var route = window.location.hash;

    if(window.location.hash.length) {
        $(route).siblings(".view").addClass("hidden");
        $(route).removeClass("hidden");
    }

    App.init();

});

var App = {

    init: function () {
        // Load FastClick
        FastClick.attach(document.body);

        // Dispatch events
        $(".js-drawer").on("click", function (e) { doUIChange(e, "getDrawer") });
        $(".js-close-drawer").on("click", function (e) { doUIChange(e, "delDrawer") });

        $(".js-notifications").on("click", function (e) { doUIChange(e, "slideDown") });

        $(".js-newstuff").on("click", function (e) { doUIChange(e, "pushUp", newStuffView) });
        $(".js-back").on("click", function (e) { doUIChange(e, "moveRight") });
        $(".js-close").on("click", function (e) { doUIChange(e, "pushDown") }); // dummyCallback
        $(".js-goprofile").on("click", function (e) { doUIChange(e, "moveLeft") });
    }

};

