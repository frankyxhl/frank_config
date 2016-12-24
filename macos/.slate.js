// Generated by CoffeeScript 1.6.3
var fullscreen, pushLeft, pushRight, pushTop;

pushRight = slate.operation("push", {
  direction: "right",
  style: "bar-resize:screenSizeX/2"
});

pushLeft = slate.operation("push", {
  direction: "left",
  style: "bar-resize:screenSizeX/2"
});

pushTop = slate.operation("push", {
  direction: "top",
  style: "bar-resize:screenSizeY/2"
});

fullscreen = slate.operation("move", {
  x: "screenOriginX",
  y: "screenOriginY",
  width: "screenSizeX",
  height: "screenSizeY"
});

slate.bind("1:cmd", function(win) {
  return win.doOperation(fullscreen);
});

slate.bind("2:cmd", function(win) {
  return win.doOperation(pushTop);
});

slate.bind("3:cmd", function(win) {
  return win.doOperation(pushLeft);
});
