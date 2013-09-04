// Generated by CoffeeScript 1.6.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["views/about_me", "views/php"], function(AboutMeView, PHPView) {
    var ResumeController, _ref;
    return ResumeController = (function(_super) {
      __extends(ResumeController, _super);

      function ResumeController() {
        _ref = ResumeController.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      ResumeController.prototype.routes = {
        "!/about-me": "aboutMe",
        "!/php": "php"
      };

      ResumeController.prototype.initialize = function() {};

      ResumeController.prototype.aboutMe = function() {
        var view;
        view = new AboutMeView();
        return view.render();
      };

      ResumeController.prototype.php = function() {
        var view;
        view = new PHPView();
        return view.render();
      };

      return ResumeController;

    })(Backbone.Router);
  });

}).call(this);