// Show random faces for "No matches found" in command palette,
// each time the command palette opens.
const NUM_OF_FACES = 30
atom.commands.onDidDispatch(event => {
  if (event.type === 'command-palette:toggle') {
    const faceNames = Array.from(Array(NUM_OF_FACES)).map(
      (_, i) => `face-${i + 1}`
    )
    const random = Math.floor(Math.random() * (NUM_OF_FACES - 1) + 1)
    const newRandomFace = faceNames[random]

    const commandPalette = atom.views
      .getView(atom.workspace)
      .querySelector('.command-palette')
    commandPalette.classList.remove(...faceNames)
    commandPalette.classList.add(newRandomFace)
  }
})
