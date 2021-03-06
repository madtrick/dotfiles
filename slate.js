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
  "x" : "screenOriginX+screenSizeX/2-windowSizeX/2",
  "y" : "screenOriginY+screenSizeY/2-windowSizeY/2",
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

var halfScreen = function(where){
  var origin;
  if (where === undefined)
    origin = "windowTopLeftX";

  if (where === "left")
    origin = "screenOriginX";

  if (where === "right")
    origin = "screenOriginX+(screenSizeX/2)";
 
 return S.op("move", {
    "x" : origin,
    "y" : "screenOriginY",
    "width" : "screenSizeX/2",
    "height": "screenSizeY"
  });
};

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
  if (to === "down") screenReference = "2";
  if (to === "up") screenReference = "1";

  return S.op("throw",{
    "screen" : screenReference,
    "width" : "screenSizeX",
     "height" : "screenSizeY"
  });
};

var moveTo = function(to){
  var x;

  if (to === "right"){
    x = "screenOriginX+(screenSizeX-windowSizeX)";
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
 * Binding setups
 ************************************/
S.bind("1:alt;cmd", quarterTopRight);
S.bind("2:alt;cmd", quarterTopLeft);
S.bind("3:alt;cmd", quarterBottomLeft);
S.bind("4:alt;cmd", quarterBottomRight);
S.bind("4:shift;cmd", widthSlice(4/12));
S.bind("8:shift;cmd", widthSlice(8/12));
S.bind("9:shift;cmd", widthSlice(10/12));

S.bind("left:cmd", focusTo("left"));
S.bind("left:alt;cmd", halfScreen("left"));
S.bind("left:cmd;shift", twoMonitorThrow("left"));

S.bind("right:cmd", focusTo("right"));
S.bind("right:alt;cmd", halfScreen("right"));
S.bind("right:cmd;shift", twoMonitorThrow("right"));

S.bind("up:cmd", focusTo("up"));
S.bind("up:cmd;shift", twoMonitorThrow("up"));

S.bind("down:cmd", focusTo("down"));
S.bind("down:cmd;shift", twoMonitorThrow("down"));

S.bind("c:alt;cmd", center);
S.bind("g:alt;cmd", fullscreen);
S.bind("h:alt;cmd", halfScreen());
S.bind("k:ctrl;alt;cmd", moveTo("right"));
S.bind("l:alt;cmd", fullHeight);
S.bind("l:ctrl;alt;cmd", moveTo("left"));

S.bind("r:ctrl;alt;cmd", S.op("relaunch"));
