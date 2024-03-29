// Generated by CoffeeScript 1.4.0
(function() {
  var Module, World, c, p, randomNum, tool,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  c = createjs;

  createjs.Ticker.setFPS(60);

  p = window.paper;

  tool = new p.Tool;

  Module = (function() {

    function Module() {}

    return Module;

  })();

  _.extend(Module.prototype, Backbone.Events);

  randomNum = function(from, to) {
    return from + (Math.floor(Math.random() * (to - from + 1)));
  };

  World = (function(_super) {

    __extends(World, _super);

    function World() {
      this._eventify();
    }

    World.prototype._eventify = function() {
      var _this = this;
      p.view.onFrame = function(e) {
        return _this.trigger('frame', e);
      };
      p.view.onResize = function(e) {
        return _this.trigger('resize', e);
      };
      tool.onMouseMove = function(e) {
        return _this.trigger('mousemove', e);
      };
      return this;
    };

    return World;

  })(Module);

  $(function() {
    var canvas, circle, world;
    canvas = $('#canvas')[0];
    p.setup(canvas);
    world = new World;
    circle = new p.Path.Circle(new p.Point(100, 100), 50);
    circle.style = {
      fillColor: '#fff'
    };
    p.view.draw();
    return window.x = (c.Tween.get(circle.position, {
      loop: true
    })).to({
      x: 300
    }, 400, c.Ease.bounceInOut).to({
      x: 200,
      y: 500
    }, 1000, c.Ease.bounceInOut).to({
      x: 500
    }, 400, c.Ease.bounceInOut).to({
      x: 300,
      y: 300
    }, 400, c.Ease.bounceInOut).call(function() {
      return console.log('done!');
    });
  });

}).call(this);
