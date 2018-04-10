const windowUtil = {
  nextSizeCycle(window) {
    const sizeCycleValues = [0.5, 0.333, 0.666]
    const currentSizeCycle = Storage.get(ids.sizeCycle(window)) === undefined
      ? 2
      : Storage.get(ids.sizeCycle(window))
    const newSizeCycle = currentSizeCycle + 1 >= sizeCycleValues.length
      ? 0
      : currentSizeCycle + 1

    Storage.set(ids.sizeCycle(window), newSizeCycle)

    return sizeCycleValues[newSizeCycle]
  },

  moveToScreen(window, newScreen, position) {
    const screenFrame = newScreen.flippedVisibleFrame()
    let newWindowFrame = {
      x: screenFrame.x + position.x,
      y: screenFrame.y + position.y,
      width: window.size().width,
      height: window.size().height,
      x2: screenFrame.x + position.x + window.size().width,
      y2: screenFrame.y + position.y + window.size().height
    }

    if (newWindowFrame.width > screenFrame.width) {
      newWindowFrame.width = screenFrame.width
    }
    if (newWindowFrame.height > screenFrame.height) {
      newWindowFrame.height = screenFrame.height
    }
    if (newWindowFrame.x2 > screenFrame.x + screenFrame.width) {
      newWindowFrame.x = screenFrame.x
    }
    if (newWindowFrame.y2 > screenFrame.y + screenFrame.height) {
      newWindowFrame.y = screenFrame.y
    }

    return newWindowFrame
  }
}
