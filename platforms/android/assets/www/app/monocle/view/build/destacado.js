// Generated by CoffeeScript 1.6.3
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  __View.Destacado = (function(_super) {
    __extends(Destacado, _super);

    function Destacado() {
      _ref = Destacado.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Destacado.prototype.container = "section#destacados article#artDestacados div#listDestacados";

    Destacado.prototype.template_url = "app/resources/templates/promocion.html";

    return Destacado;

  })(Monocle.View);

}).call(this);
