# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"


# Display random face for error-message in command palette.
# Randomized on each command-palette toggle
atom.commands.onDidDispatch (event) ->
  if event.type is "command-palette:toggle"
    workspaceElement = atom.views.getView(atom.workspace)
    commandPalette = workspaceElement.querySelector(".command-palette")
    commandPalette.classList
      .remove("face-1", "face-2", "face-3", "face-4", "face-5", "face-6", "face-7", "face-8", "face-9", "face-10", "face-11", "face-12", "face-13", "face-14", "face-15", "face-16")
    commandPalette.classList
      .add("face-#{Math.floor(Math.random() * (16 - 1) + 1)}")
