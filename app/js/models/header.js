// Generated by CoffeeScript 1.6.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define([], function() {
    var HeaderModel, _ref;
    return HeaderModel = (function(_super) {
      __extends(HeaderModel, _super);

      function HeaderModel() {
        _ref = HeaderModel.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      HeaderModel.prototype.defaults = {
        title: {
          en: "Web-developer resume",
          ru: "Резюме WEB-разработчика"
        }
      };

      return HeaderModel;

    })(Backbone.Model);
  });

}).call(this);
