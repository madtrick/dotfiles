//S.cfga({
//  "defaultToCurrentScreen"         : true,
//  "windowHintsShowIcons"           : true,
//  "windowHintsIgnoreHiddenWindows" : false,
//  "windowHintsSpread"              : true,
//  "windowHintsSpreadPadding"       : 40
//});
//

/*
 * Operations
 */

var fullscreen = S.op("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height": "screenSizeY"
});

var center = S.op("move", {
  "x" : "screenSizeX/2 - windowSizeX/2",
  "y" : "screenSizeY/2 - windowSizeY/2",
  "width" : "windowSizeX",
  "height": "windowSizeY"
});

var quarterTopRight = S.op("move",{
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX/2",
    "height": "screenSizeY/2"
});

var quarterTopLeft = S.op("move",{
    "x" : "screenSizeX/2",
    "y" : "screenOriginY",
    "width" : "screenSizeX/2",
    "height": "screenSizeY/2"
});

var quarterBottomRight = S.op("move",{
    "x" : "screenOriginX",
    "y" : "screenOriginY + (screenSizeY/2)", //Way to get the valid y coordinate
    "width" : "screenSizeX/2",
    "height": "screenSizeY/2"
});

var quarterBottomLeft = S.op("move",{
    "x" : "screenSizeX/2",
    "y" : "screenOriginY + (screenSizeY/2)", //Way to get the valid y coordinate
    "width" : "screenSizeX/2",
    "height": "screenSizeY/2"
});

var halfScreen = S.op("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX/2",
  "height": "screenSizeY"
});

var fullHeight = S.op("move", {
  "x" : "windowTopLeftX",
  "y" : "screenOriginY",
  "width" : "windowSizeX",
  "height": "screenSizeY"
});

var widthSlice = function(slice){
  var width = "trunc(screenSizeX*" + slice + ")";
  return S.op("move",{
      "x" : "windowTopLeftX",
      "y" : "windowTopLeftY",
      "width" : width,
      "height" : "windowSizeY"
  });
};

var twoMonitorThrow = function(to){
  var screenReference;

  if (to === "left") screenReference = "0";
  if (to === "right") screenReference = "1";
  if (to === "down") screenReference = "1";
  if (to === "up") screenReference = "0";

  return S.op("throw",{
    "screen" : screenReference,
    "width" : "screenSizeX",
     "height" : "screenSizeY"
  });
};

var moveTo = function(to){
  var x;

  if (to === "right"){
    x = "screenSizeX-windowSizeX";
  }

  if (to === "left"){
    x = "screenOriginX";
  }

  return S.op("move",{
      "x" : x,
      "y" : "windowTopLeftY",
      "width" : "windowSizeX",
      "height" : "windowSizeY"
  });
};

var focusTo = function(to){
  return S.op("focus", {
    direction : to
  });
};


/************************************
 * Screen setups
 ************************************/
var monitorsResolutions = {
  samsung : "2560x1440",
  macbook : "1440x900"
};

var twoMonitorScreenConfigBigUpLaptopDown = {
  resolutions : [monitorsResolutions.samsung, monitorsResolutions.macbook],
  screens : {
    samsung : 0,
    macbook : 1
  }
};

var oneMonitorScreenConfigBig = {
  resolutions : [monitorsResolutions.samsung],
  screens : {
    samsung : 0
  }
};

/************************************
 * Layout setups
 ************************************/
var twoMonitorLayouBigUpLaptopDown = S.layout("twoMonitorLayouBigUpLaptopDown", {
  "iTerm" : {
    operations : [fullscreen]
  },
  "Google Chrome" : {
    operations : [S.op("move", {
      x : "screenOriginX",
      y : "screenOriginY",
      width : "screenSizeX",
      height : "screenSizeY",
      screen : twoMonitorScreenConfigBigUpLaptopDown.screens.macbook
    })]
  }
});


var oneMonitorLayoutBig = S.layout("oneMonitorLayoutBig", {
  "iTerm" : {
    /*
     * NOTE: 
     * I have to use a function to apply to operations to the same window as "chain" and "sequence" didn't work
     */
     
    operations : [function(win){
      win.doOperation(widthSlice(8/12));
      win.doOperation(fullHeight);
      win.doOperation(moveTo("left"));
    }]
  },
  "Google Chrome" : {
    /*
     * NOTE: using the win object to move the Chrome window doesn't work 
     * see https://github.com/jigish/slate/issues/287
     */
    //operations : [function(win){
    //  win.doOperation(widthSlice(4/12));
    //  win.doOperation(fullHeight);
    //  win.doOperation(moveTo("right"));
    //}]
    operations : [S.op("move",{
      x : "screenSizeX-(trunc(screenSizeX*4/12))",
      y : "screenOriginY",
      width : "trunc(screenSizeX*4/12)",
      height: "screenSizeY"
    })]
  }
});

var latexEditionLayout = S.layout("latexEditionLayout", {
  "iTerm" : {
    operations : [function(win){
      win.doOperation(widthSlice(8/12));
      win.doOperation(fullHeight);
      win.doOperation(moveTo("left"));
    }]
  },
  "Preview" : {
  operations : [function(win){
      win.doOperation(widthSlice(4/12));
      win.doOperation(fullHeight);
      win.doOperation(moveTo("right"));
    }]
  }
});

/************************************
 * Binding setups
 ************************************/
S.bind("g:alt;cmd", fullscreen);
S.bind("c:alt;cmd", center);
S.bind("1:alt;cmd", quarterTopRight);
S.bind("2:alt;cmd", quarterTopLeft);
S.bind("3:alt;cmd", quarterBottomLeft);
S.bind("4:alt;cmd", quarterBottomRight);
S.bind("h:alt;cmd", halfScreen);
S.bind("l:alt;cmd", fullHeight);
S.bind("4:shift;cmd", widthSlice(4/12));
S.bind("8:shift;cmd", widthSlice(8/12));
S.bind("left:cmd;shift", twoMonitorThrow("left"));
S.bind("right:cmd;shift", twoMonitorThrow("right"));
S.bind("up:cmd;shift", twoMonitorThrow("up"));
S.bind("down:cmd;shift", twoMonitorThrow("down"));
S.bind("left:cmd", focusTo("left"));
S.bind("right:cmd", focusTo("right"));
S.bind("up:cmd", focusTo("up"));
S.bind("down:cmd", focusTo("down"));

S.bind("l:ctrl;alt;cmd", moveTo("left"));
S.bind("k:ctrl;alt;cmd", moveTo("right"));

S.bind("l:fn;ctrl;alt", S.op("layout", {name : latexEditionLayout}));
S.bind("p:fn;ctrl;alt", S.op("layout", {name : oneMonitorLayoutBig}));

/************************************
 * Default setups
 ************************************/
S.default(twoMonitorScreenConfigBigUpLaptopDown.resolutions, twoMonitorLayouBigUpLaptopDown);
S.default(oneMonitorScreenConfigBig.resolutions, oneMonitorLayoutBig);
/*
 * Helpers
 */

