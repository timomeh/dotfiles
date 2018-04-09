function posWindow(window, { x, y }) {
  return {
    x: window.screen().flippedVisibleFrame().x + (x || 0),
    y: window.screen().flippedVisibleFrame().y + (y || 0)
  }
}
