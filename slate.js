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
  return S.op("move",{
      "x" : "windowTopLeftX",
      "y" : "windowTopLeftY",
      "width" : function(){
        return Math.round(S.screen().rect().width*slice);
      },
      "height" : "windowSizeY"
  });
};

var moveTo = function(to){
  return S.op("move",{
      "x" : function(){
        var x,
            windowWidth = S.app().mainWindow().size().width,
            screenWidth = S.screen().rect().width;

        if (to === "left"){
          x = screenWidth - windowWidth;
        }

        if (to === "right"){
          x = "screenOriginX";
        }

        return x;
      },
      "y" : "windowTopLeftY",
      "width" : "windowSizeX",
      "height" : "windowSizeY"
  });
};

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
S.bind("4:shift;cmd", widthSlice(4/12));
S.bind("8:shift;cmd", widthSlice(8/12));

S.bind("l:ctrl;alt;cmd", moveTo("left"));
S.bind("k:ctrl;alt;cmd", moveTo("right"));
/*
 * Helpers
 */

