// Generated by CoffeeScript 1.6.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["collections/qualities", "views/quality", "text!templates/skill.html"], function(QualityCollection, QualityView, template) {
    var SkillView, _ref;
    return SkillView = (function(_super) {
      __extends(SkillView, _super);

      function SkillView() {
        _ref = SkillView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      SkillView.prototype.tagName = "div";

      SkillView.prototype.className = "skill-container";

      SkillView.prototype.qualityContainer = $(".quality-container");

      SkillView.prototype.template = _.template(template);

      SkillView.prototype.events = {
        "click": "overSkill",
        "focusout": "closeSkill"
      };

      SkillView.prototype.initialize = function() {
        return this.collection = new QualityCollection(this.model.toJSON().quality);
      };

      SkillView.prototype.render = function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      };

      SkillView.prototype.overSkill = function(event) {
        var cnt, that;
        this.qualityContainer.find(".quality").remove();
        that = this;
        cnt = this.$el.find(".skill").data("src");
        return _.each(this.collection.models, function(item) {
          return that.renderQualities(item);
        }, this);
      };

      SkillView.prototype.renderQualities = function(quality) {
        var qualityView;
        qualityView = new QualityView({
          model: quality
        });
        this.qualityContainer.append(qualityView.render().el);
        return this.qualityContainer.show();
      };

      return SkillView;

    })(Backbone.View);
  });

}).call(this);
