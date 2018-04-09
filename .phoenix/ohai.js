Key.on('i', ['ctrl', 'cmd'], function() {
  const typeKeys = ['j', 'k', 'l', 'f', 'd', 's', 'a', 'u', 'i', 'o', 'p', 't', 'r', 'e', 'w', 'q']
  let windowModals = {}
  let firstKeyPresses = []
  let secondKeyPresses = []

  const closeKey = Key.on('escape', [], function() {
    closeAllWindowModals()
    cleanupKeyPresses()
  })

  function closeAllWindowModals() {
    Object.keys(windowModals).forEach(modalKey => {
      windowModals[modalKey].modal.close()
    })
  }

  function cleanupKeyPresses() {
    Key.off(closeKey)
    firstKeyPresses.forEach(handler => Key.off(handler))
    secondKeyPresses.forEach(handler => Key.off(handler))
  }

  const screensWithWindows = Screen.all().map(screen =>
    screen.currentSpace().windows()
  )

  screensWithWindows.forEach((windows, i) => {
    const screenKey = typeKeys[i]

    windows.forEach((window, k) => {
      if (!window.isVisible()) return
      const windowKey = typeKeys[k]

      const sFrame = Screen.main().flippedVisibleFrame()
      const wFrame = window.frame()

      const findKey = screenKey + windowKey

      const windowModal = Modal.build({
        origin(mFrame) {
          return {
            x: wFrame.x + wFrame.width / 2 - mFrame.width / 2,
            y: sFrame.height - (wFrame.y + wFrame.height / 2)
          }
        },
        weight: 18,
        appearance: 'dark',
        icon: window.app().icon(),
        text: findKey
      })

      windowModals[findKey] = {
        modal: windowModal,
        window: window
      }
      windowModal.show()
    })
  })

  firstKeyPresses = typeKeys.map(firstTypeKey => {
    return Key.on(firstTypeKey, [], function() {
      windowModals = Object.keys(windowModals).reduce((acc, val) => {
        const modalObj = windowModals[val]

        if (val.startsWith(firstTypeKey)) {
          return Object.assign({}, acc, { [val]: modalObj })
        } else {
          modalObj.modal.close()
          return acc
        }
      }, {})

      if (!Object.keys(windowModals).length) {
        cleanupKeyPresses()
        return
      }

      firstKeyPresses.forEach(handler => Key.off(handler))

      secondKeyPresses = typeKeys.map(secondTypeKey => {
        return Key.on(secondTypeKey, [], function() {
          const foundWindow = windowModals[firstTypeKey + secondTypeKey]

          if (foundWindow) {
            foundWindow.window.focus()
          }

          closeAllWindowModals()
          cleanupKeyPresses()
        })
      })
    })
  })
})
