const workspaceElement = atom.views.getView(atom.workspace)
const tabBar = workspaceElement.querySelector(".tab-bar[location=center]")

atom.commands.onDidDispatch(event => {
  if (event.type === 'command-palette:toggle') {
    const commandPalette = workspaceElement.querySelector(".command-palette")
    commandPalette.classList
      .remove("face-1", "face-2", "face-3", "face-4", "face-5", "face-6", "face-7", "face-8", "face-9", "face-10", "face-11", "face-12", "face-13", "face-14", "face-15", "face-16")
    commandPalette.classList
      .add(`face-${Math.floor(Math.random() * (16 - 1) + 1)}`)
  }
})


/***
 * toggle indented class on tabbar when left dock visibility changes
 */
const leftDock = atom.workspace.getLeftDock()

// Monkeypatch callback for show/hide dock
const handleDockVisibleChange = (visible) => onDockVisibleChange(visible)
const onDockVisibleChange = ({ visible }) => {
  visible
    ? tabBar.classList.remove("indented")
    : tabBar.classList.add("indented")
}
const leftDockOldShow = leftDock.show
const leftDockOldHide = leftDock.hide
leftDock.show = function () { leftDockOldShow.apply(this, arguments); handleDockVisibleChange({ visible: this.state.visible }); }
leftDock.hide = function () { leftDockOldHide.apply(this, arguments); handleDockVisibleChange({ visible: this.state.visible }); }

leftDock.isVisible() ? tabBar.classList.remove("indented") : tabBar.classList.add("indented")
