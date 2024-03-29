// Generated by CoffeeScript 1.4.0
(function() {
  var p,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  p = window.paper;

  $(function() {
    var Module, World, canvas, tool, world;
    canvas = $("#myCanvas")[0];
    p.setup(canvas);
    /*
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
    */

    Module = (function() {

      function Module() {}

      return Module;

    })();
    _.extend(Module.prototype, Backbone.Events);
    tool = new p.Tool;
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
    world = new World;
    return p.view.draw();
  });

}).call(this);
