// Generated by CoffeeScript 1.6.3
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  __View.Comercio = (function(_super) {
    __extends(Comercio, _super);

    function Comercio() {
      _ref = Comercio.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Comercio.prototype.container = "section#subcategorias article#layout-art2 div#list ul";

    Comercio.prototype.template_url = "app/resources/templates/comercio.html";

    return Comercio;

  })(Monocle.View);

}).call(this);
