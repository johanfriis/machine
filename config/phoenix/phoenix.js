Phoenix.notify("Phoenix config loading")

Phoenix.set({
  openAtLogin: true,
  daemon: true, // hides system menu icon
})

let keys = []
let cycleArray = []

function cycle () {
  const current = Window.focused()
  if (current) {
    if (cycleArray.length < 2) {
      if (cycleArray.length === 1 && cycleArray.some(el => el.isEqual(current)))
        return
      Phoenix.notify(`Added to cycle ${current.title()}`)
      cycleArray.unshift(current)
    } else {
      let [visible, invisible] = cycleArray
      // if current is the invisible window, focus visible
      current.isEqual(invisible) ? visible.focus() : invisible.focus()
      cycleArray = [invisible, visible]
    }
  }
}

function clearCycle () {
  Phoenix.notify(`Cleared cycle`)
  cycleArray = []
}

function keyBinding (key, description, modifier, fn) {
  keys.push(
    Key.on(key, modifier, fn)
  )
}

const mash = ['ctrl', 'alt']
const megaMash = ['ctrl', 'alt', 'shift']

keyBinding('n', 'Cycle pair of windows', mash, cycle)
keyBinding('n', 'Clear cycle', megaMash, clearCycle)

Phoenix.notify("Phoenix config loaded oadded!")
