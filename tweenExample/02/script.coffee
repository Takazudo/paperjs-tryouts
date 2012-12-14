c = createjs
createjs.Ticker.setFPS 60

# paper.js things

p = window.paper
tool = new p.Tool

# utils

class Module
_.extend Module::, Backbone.Events

randomNum = (from, to) ->
  from + (Math.floor (Math.random() * (to - from + 1)))

# world organizer

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

$ ->

  canvas = $('#canvas')[0]
  p.setup canvas

  world = new World

  circle = new p.Path.Circle (new p.Point 100, 100), 50
  circle.style =
    fillColor: '#fff'

  p.view.draw()

  window.x = (c.Tween.get circle.position, { loop: true })
  .to({ x:300 }, 400, c.Ease.bounceInOut)
  .to({ x:200, y:500 }, 1000, c.Ease.bounceInOut)
  .to({ x:500 }, 400, c.Ease.bounceInOut)
  .to({ x:300, y: 300 }, 400, c.Ease.bounceInOut)
  .call -> console.log 'done!'



#var tween = Tween.get(myTarget).to({x:300},400).set({label:"hello!"}).wait(500).to({alpha:0,visible:false},1000).call(onComplete);
