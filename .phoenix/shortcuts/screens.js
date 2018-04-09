function moveToScreen(window, dir) {
  const relPos = {
    x: window.topLeft().x - window.screen().flippedVisibleFrame().x,
    y: window.topLeft().y - window.screen().flippedVisibleFrame().y,
  }

  if (window.screen()[dir]().currentSpace().isFullScreen()) return

  window.setTopLeft({
    x: window.screen()[dir]().flippedVisibleFrame().x + relPos.x,
    y: window.screen()[dir]().flippedVisibleFrame().y + relPos.y
  })
}

Key.on('u', [ 'ctrl', 'cmd' ], function () {
  var window = Window.focused()
  if (!window) return

  moveToScreen(window, 'next')
})

Key.on('o', [ 'ctrl', 'cmd' ], function () {
  var window = Window.focused()
  if (!window) return

  moveToScreen(window, 'previous')
})
