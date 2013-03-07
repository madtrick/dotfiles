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

/*
 * Bindings
 */

S.bind("g:alt;cmd", fullscreen);
S.bind("c:alt;cmd", center);
S.bind("1:alt;cmd", quarterTopRight);
S.bind("2:alt;cmd", quarterTopLeft);
S.bind("3:alt;cmd", quarterBottomLeft);
S.bind("4:alt;cmd", quarterBottomRight);
S.bind("h:alt;cmd", halfScreen);
S.bind("l:alt;cmd", fullHeight);

/*
 * Helpers
 */

