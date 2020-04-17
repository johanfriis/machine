#!coffee -pl

## The config Proper begins here

  Phoenix.notify "Phoenix config loading"

  Phoenix.set
    daemon: true
    openAtLogin: true

## Constants

  MARGIN_X = 12
  MARGIN_Y = 12
  GRID_WIDTH = 20
  GRID_HEIGHT = 16

## Helpers

  _.mixin
    flatmap: (list, iteratee) ->
      _.flatten _.map(list, iteratee)

  debug = (o, label="obj: ") ->
    str = if o then JSON.stringify(o, undefined, 2) || o.toString() else o
    Phoenix.log str

  focused = -> Window.focused()

  Window::screenRect = (screen) -> screen?.flippedVisibleFrame() || @screen().flippedVisibleFrame()
  Window::fullGridFrame = -> @calculateGrid x: 0, y: 0, width: 1, height: 1

## Window Grid

Calculate grid based on parameters

  Window::calculateGrid = ({x, y, width, height}) ->
    rect = @screenRect()
    {
      y: Math.round(y * rect.height) + MARGIN_Y + rect.y,
      x: Math.round(x * rect.width) + MARGIN_X + rect.x,
      width: Math.round(width * rect.width) - 2.0 * MARGIN_X,
      height: Math.round(height * rect.height) - 2.0 * MARGIN_Y,
    }

Window left half width

  Window::proportionWidth = ->
    sw = @screenRect().width
    ww = @frame().width
    Math.round((ww/sw)*10)/10

Window to grid

  Window::toGrid = ({x, y, width, height}) ->
    rect = @calculateGrid {x, y, width, height}
    @setFrame rect

## Window moving and sizing

  Window::togglingWidth = ->
    0.5
  #switch @proportionWidth()
  #    when 0.8 then 0.5
  #    when 0.5 then 0.3
  #    else 0.8

  Window::toLeftToggle = -> @toGrid x: 0, y: 0, width: @togglingWidth(), height: 1
  Window::toRightToggle = -> @toGrid x: 1 - @togglingWidth(), y: 0, width: @togglingWidth(), height: 1

  lastFrames = {}

  Window::rememberFrame = -> lastFrames[@hash()] = @frame()
  Window::forgetFrame = -> delete lastFrames[@hash()]

  Window::toggleFullScreen = ->
    unless _.isEqual @frame(), @fullGridFrame()
      @rememberFrame()
      @toGrid x: 0, y: 0, width: 1, height: 1
    else if lastFrames[@hash()]
      @setFrame lastFrames[@hash()]
      @forgetFrame()

  Window::center = (gridWidth, gridHeight) ->
    rect = @screenRect()
    current = @frame()

    if gridWidth and gridHeight
      grid = @calculateGrid x: 0, y: 0, width: gridWidth, height: gridHeight
    else
      grid = width: current.width, height: current.height

    frame =
      x: (rect.width / 2) - (grid.width / 2)
      y: (rect.height / 2) - (grid.height / 2)
      width: grid.width
      height: grid.height

    unless _.isEqual frame, current
      @rememberFrame()
      @setFrame frame
    else if lastFrames[@hash()]
      @setFrame lastFrames[@hash()]
      @forgetFrame()

  Window::pin = () ->
    allSpaces = Space.all()
    if @spaces().length == Space.all().length
      Space.all().map (s) =>
        s.removeWindows [this] unless s.isEqual Space.active()
    else
      Space.all().map (s) => s.addWindows [this]

  Window::moveToSpace = (spaceIdx) ->
    currentSpace = Space.active()
    allSpaces = Space.all()
    unless (spaceIdx < 0 or spaceIdx > allSpaces.length) or allSpaces[spaceIdx].isEqual currentSpace
      @spaces().map (s) =>
        s.removeWindows [this]
      allSpaces[spaceIdx].addWindows [this]

## Applications

  App.focusOrLaunch = (application) ->
    unless _.isArray application
      application = [application, application]
    [findName, launchName] = application
    app = App.get(findName)
    if app
      app.focus()
    else
      Phoenix.notify "Launching #{launchName}"
      App.launch launchName

## Bindings

Alias Phoenix.bind as key_binding to increase readability

  keys = []

The key_binding method includes the unused description parameter, for potential future help use

  key_binding = (key, description, modifier, fn) -> keys.push Key.on(key, modifier, fn)

  mash = [ 'cmd', 'ctrl', 'shift' ]
  megamash = ['alt', 'ctrl', 'shift' ]

Move the current window to top/right/bottom/left half of screen and fill it

  key_binding 'a', 'Left side toggle', mash, -> focused().toLeftToggle()
  key_binding 'd', 'Right side toggle', mash, -> focused().toRightToggle()
  key_binding 'space', 'Maximize Window', mash, -> focused().toggleFullScreen()
  key_binding 'f', 'Fullscreen Window', mash, -> focused().setFullScreen(!focused().isFullScreen())

  key_binding 's', 'Center Window', mash, -> focused().center()
  key_binding 'x', 'Center Window 85%', mash, -> focused().center(0.85, 0.85)
  key_binding 'p', 'Pin Window', mash, -> focused().pin()

  key_binding '1', 'Move window to Space 1', megamash, -> focused().moveToSpace(0)
  key_binding '2', 'Move window to Space 2', megamash, -> focused().moveToSpace(1)
  key_binding '3', 'Move window to Space 3', megamash, -> focused().moveToSpace(2)
  key_binding '4', 'Move window to Space 4', megamash, -> focused().moveToSpace(3)
  key_binding '5', 'Move window to Space 5', megamash, -> focused().moveToSpace(4)
  key_binding '6', 'Move window to Space 6', megamash, -> focused().moveToSpace(5)
  key_binding '7', 'Move window to Space 7', megamash, -> focused().moveToSpace(6)
  key_binding '8', 'Move window to Space 8', megamash, -> focused().moveToSpace(7)
  key_binding '9', 'Move window to Space 9', megamash, -> focused().moveToSpace(8)

  #key_binding 'q', 'Launch VS Code', mash, -> App.focusOrLaunch ["Code", "Visual Studio Code"]
  #key_binding 'w', 'Launch Hyper', mash, -> App.focusOrLaunch "Hyper"
  #key_binding 'e', 'Launch Franz', mash, -> App.focusOrLaunch "Franz"

  Phoenix.notify "Loaded"
