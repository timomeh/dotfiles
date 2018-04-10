// Move to left screen
Key.on('u', ['ctrl', 'cmd'], function() {
  var window = Window.focused()
  if (!window) return

  const newScreen = window.screen().next()
  if (newScreen.currentSpace().isFullScreen()) return

  const position = screenUtil.windowTopLeft(window)
  window.setFrame(windowUtil.moveToScreen(window, newScreen, position))
})

// Move to right screen
Key.on('o', ['ctrl', 'cmd'], function() {
  var window = Window.focused()
  if (!window) return

  const newScreen = window.screen().previous()
  if (newScreen.currentSpace().isFullScreen()) return

  const position = screenUtil.windowTopLeft(window)
  window.setFrame(windowUtil.moveToScreen(window, newScreen, position))
})
