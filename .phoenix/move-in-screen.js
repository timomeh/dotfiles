// Fullscreen
Key.on('k', [ 'ctrl', 'cmd' ], function () {
  var window = Window.focused()
  if (!window) return

  window.setFrame(window.screen().flippedVisibleFrame())
})

// Left, cycle through 1/2 1/3 2/3
Key.on('j', [ 'ctrl', 'cmd' ], function () {
  var window = Window.focused()
  if (!window) return

  const screenFrame = window.screen().flippedVisibleFrame()
  const widthMultiplier = windowUtil.nextSizeCycle(window)

  window.setFrame({
    x: screenFrame.x,
    y: screenFrame.y,
    width: screenFrame.width * widthMultiplier,
    height: screenFrame.height
  })
})

// Right, cycle through 1/2 1/3 2/3
Key.on('l', [ 'ctrl', 'cmd' ], function () {
  var window = Window.focused()
  if (!window) return

  const screenFrame = window.screen().flippedVisibleFrame()
  const widthMultiplier = windowUtil.nextSizeCycle(window)
  const newWidth = screenFrame.width * widthMultiplier

  window.setFrame({
    x: screenFrame.x + screenFrame.width - newWidth,
    y: screenFrame.y,
    width: newWidth,
    height: screenFrame.height
  })
})
