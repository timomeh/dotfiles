var PADDING = 7

function windowSpaceyPos(window, frame) {
  window.setFrame({
    x: frame.x + PADDING,
    y: frame.y + PADDING,
    width: frame.width - PADDING * 2,
    height: frame.height - PADDING * 2
  })
}
