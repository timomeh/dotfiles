const screenUtil = {
  windowTopLeft(window) {
    return {
      x: window.topLeft().x - window.screen().flippedVisibleFrame().x,
      y: window.topLeft().y - window.screen().flippedVisibleFrame().y,
    }
  }
}
