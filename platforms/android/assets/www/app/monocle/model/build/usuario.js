// Generated by CoffeeScript 1.6.3
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  __Model.Usuario = (function(_super) {
    __extends(Usuario, _super);

    function Usuario() {
      _ref = Usuario.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Usuario.fields("id", "nombre", "email", "sexo", "edad", "ciudad", "idNivelEstudio", "idFacebook", "fecha");

    Usuario.prototype.validate = function() {
      if (!this.nombre) {
        "nombre es obligatorio";
      }
      if (!this.nombre) {
        return "nombre es obligatorio";
      }
    };

    return Usuario;

  })(Monocle.Model);

}).call(this);
