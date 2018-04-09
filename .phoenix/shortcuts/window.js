Key.on('k', [ 'ctrl', 'cmd' ], function () {
  var window = Window.focused()
  if (!window) return

  windowSpaceyPos(window, window.screen().flippedVisibleFrame())
})

Key.on('j', [ 'ctrl', 'cmd' ], function () {
  var window = Window.focused()
  if (!window) return

  windowSpaceyPos(window, {
    x: window.screen().flippedVisibleFrame().x,
    y: window.screen().flippedVisibleFrame().y,
    width: window.screen().flippedVisibleFrame().width / 2,
    height: window.screen().flippedVisibleFrame().height
  })
})

Key.on('l', [ 'ctrl', 'cmd' ], function () {
  var window = Window.focused()
  if (!window) return

  const newWidth = window.screen().flippedVisibleFrame().width / 2
  const newHeight = window.screen().flippedVisibleFrame().height
  const newWindowPos = posWindow(window, { x: newWidth })

  windowSpaceyPos(window, {
    x: newWindowPos.x,
    y: newWindowPos.y,
    width: newWidth,
    height: newHeight
  })
})
