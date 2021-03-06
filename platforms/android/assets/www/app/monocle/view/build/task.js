// Generated by CoffeeScript 1.6.3
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  __View.Task = (function(_super) {
    __extends(Task, _super);

    function Task() {
      _ref = Task.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Task.prototype.container = "section#third article ul";

    Task.prototype.template_url = "app/resources/templates/task.html";

    Task.prototype.events = {
      "tap li": "onTap"
    };

    Task.prototype.onTap = function(event) {
      this.model.updateAttributes({
        done: true
      });
      return this.refresh();
    };

    return Task;

  })(Monocle.View);

}).call(this);
