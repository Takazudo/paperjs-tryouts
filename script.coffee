p = window.paper

$ ->

  canvas = $("#myCanvas")[0]
  p.setup canvas

  #path = new p.Path
  #path.strokeColor = "black"

  #path.add (new p.Point 0, 0)
  #path.add (new p.Point 300, 300)

  #path.insert 1 , (new p.Point 100, 50)
  #path.closed = true

  #path.position.x += 100
  #path.position.y += 100

  #circle = new p.Path.Circle (new p.Point 100, 70), 50
  #circle.strokeColor = 'red'
  #circle.fillColor = 'blue'
  #circle.strokeWidth = 10
  
  #===

  #rect = new p.Rectangle (new p.Point 10, 10), (new p.Point 100, 80)
  #path = new p.Path.Rectangle rect
  #path.fillColor = '#e9eff'
  #path.selected = true

  #===

  #rect = new p.Rectangle (new p.Point 10, 10), (new p.Point 100, 80)
  #corner = new p.Size 20, 20
  #path = new p.Path.RoundRectangle rect, corner
  #path.fillColor = '#e9eff'

  #===
  
  #triangle = new p.Path.RegularPolygon (new p.Point 80, 70), 3, 50
  #triangle.fillColor = '#e9e9ff'
  #triangle.selected = true
  
  #===
  
  #path = new p.Path.Circle (new p.Point 80, 50), 35
  #path.fillColor = 'blue'

  #path = new p.Path.Circle (new p.Point 200, 250), 45
  #path.fillColor = 'red'

  #p.project.activeLayer.firstChild.selected = true
  
  #===
  
  #circle = new p.Path.Circle (new p.Point 100, 70), 50
  #circle.style =
  #  strokeColor: 'red'
  #  fillColor: 'orange'
  #  strokeWidth: 10

  #circle2 = circle.clone()
  #circle2.position.x += 50
  #circle2.opacity = 0.5
  
  #===

  #bg = new p.Path.Rectangle p.view.bounds
  #bg.fillColor = 'orange'

  #===

  #tool = new p.Tool

  #path = new p.Path.Circle (new p.Point 50, 50), 25
  #path.fillColor = 'black'

  #tool.onMouseMove = (e) ->
  #  path.position = e.point

  #===
  
  #triangle = new p.Path.RegularPolygon (new p.Point 80, 70), 3, 50
  #triangle.fillColor = '#e9e9ff'
  #triangle.selected = true
  #triangle.position.x = 200
  #triangle.position.y = 200

  #p.view.onFrame = (e) ->
  #  #triangle.position.angle += 1
  #  triangle.rotate 1

  #===
  
  #path = new p.Path.Rectangle (new p.Point 50, 50), (new p.Size 100, 50)
  #path.style =
  #  fillColor: 'white'
  #  strokeColor: 'black'
  #
  #copy = path.clone()
  #copy.strokeColor = 'red'

  #point = copy.bounds.bottomLeft
  #
  #p.view.onFrame = (e) ->
  #  copy.rotate 10, point

  #===
  
  #preload = ->
  #  $.Deferred (defer) ->
  #    $img = $("<img id='img1' width='720' height='720'>")
  #    $img.css
  #      position: 'fixed'
  #      left: 0
  #      top:0
  #      opacity:.2
  #    $img.appendTo 'body'
  #    $img.on 'load', ->
  #      defer.resolve()
  #    $img.attr 'src', 'img.png'
  #  .promise()

  #preload().done ->
  #  raster = new p.Raster 'img1'
  #  raster.position = p.view.center
  #  raster.scale 0.5
  #  raster.rotate 45
  #  p.view.onFrame = (e) ->
  #    raster.rotate 3
  #
  #  #p.view.draw()
  
  #===

  ###
  rect = new p.Rectangle (new p.Point 200, 200), (new p.Point 250, 300)
  path = new p.Path.Rectangle rect
  path.fillColor = '#e9eff'

  vector = new p.Point 100, 30
  path2 = path.clone()
  path.opacity = 0.4

  #path2.position = path2.position.add vector
  ## point + point
  
  #path2.position = path2.position.subtract vector
  ## point - point

  #path2.position = path2.position.add (vector.multiply 3)
  ## point * number

  #path2.position = path2.position.add (vector.divide 2)
  ## point / number

  #path.position.x += vector.x
  #path.position.y += vector.y
  ####
  
  
  #===
  
  #randomNum = (from, to) ->
  #  from + (Math.floor (Math.random() * (to - from + 1)))

  #do ->

  #  tool = new p.Tool

  #  count = 50

  #  path = new p.Path.Circle (new p.Point 0, 0), 5
  #  path.style =
  #    fillColor: 'white'
  #    strokeColor: 'black'

  #  symbol = new p.Symbol path

  #  do ->
  #    i = 0
  #    while i < count
  #      center = p.Point.random().multiply p.view.size
  #      placed = symbol.place center
  #      placed.scale (i/count*2 + 0.1)
  #      placed.data = {}
  #      placed.data.vector = new p.Point
  #        angle: Math.random() * 360
  #        length: (i/count) * Math.random() / 5 + 2
  #      i += 1

  #  vector = new p.Point
  #    angle: 45
  #    length: 0

  #  mouseVector = vector.clone()

  #  tool.onMouseMove = (e) ->
  #    mouseVector = p.view.center.subtract e.point

  #  keepInView = (item) ->
  #    position = item.position
  #    viewBounds = p.view.bounds
  #    return if position.isInside viewBounds
  #    itemBounds = item.bounds
  #    if position.x > viewBounds.width + 5
  #      position.x = -item.bounds.width
  #    if position.x < -itemBounds.width - 5
  #      position.x = viewBounds.width
  #    if position.y > viewBounds.height + 5
  #      position.y = -item.bounds.height
  #    if position.y < -itemBounds.height - 5
  #      position.y = viewBounds.height

  #  p.view.onFrame = (e) ->
  #    vector = vector.add ((mouseVector.subtract vector).divide 30)
  #    i = 0
  #    while i < count
  #      item = p.project.activeLayer.children[i]
  #      size = item.bounds.size
  #      length = vector.length / 15 * size.width / 10
  #      item.position  = item.position.add ((vector.normalize length).add item.data.vector)
  #      keepInView item
  #      i += 1

  #===
  
  #do ->

  #  canvas1 = $('#myCanvas1')[0]
  #  p1 = new p.PaperScope
  #  p1.project = new p.Project
  #  p1.view = new p.View canvas1

  #  circle = new p1.Path.Circle (new p1.Point 100, 70), 50
  #  circle.strokeColor = 'black'
  #  circle.selected = true
  #  circle.fillColor = 'white'

  #  p1.view.draw()
  #

  #do ->

  #  canvas2 = $('#myCanvas2')[0]
  #  p2 = new p.PaperScope
  #  p2.project = new p.Project
  #  p2.view = new p.View canvas2

  #  circle = new p2.Path.Circle (new p2.Point 200, 100), 50
  #  circle.strokeColor = 'black'
  #  circle.selected = true
  #  circle.fillColor = 'white'

  #  p2.view.draw()
  
  #===
  
  #class Module
  #_.extend Module::, Backbone.Events

  #class ConcreteClass extends Module
  #  constructor: ->
  #    [kjkk


  #hoge = new Module
  #hoge.on 'event1', ->
  #  console.log 'event1 fired'

  #hoge.trigger 'event1'

  #===
  
  class Module
  _.extend Module::, Backbone.Events

  tool = new p.Tool

  class World extends Module
    constructor: ->
      @_eventify()
    _eventify: ->
      p.view.onFrame = (e) =>
        @trigger 'frame', e
      p.view.onResize = (e) =>
        @trigger 'resize', e
      tool.onMouseMove = (e) =>
        @trigger 'mousemove', e
      @

  world = new World

  #world.on 'frame', ->
  #  console.log 'event1'
  #world.on 'frame', ->
  #  console.log 'event2'
  

  p.view.draw()

  

