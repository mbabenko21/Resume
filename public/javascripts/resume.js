// Generated by CoffeeScript 1.6.3
(function() {
  var QualityCollection, QualityModel, QualityView, ResumeView, SkillModel, SkillView, SkillsCollection, _ref, _ref1, _ref2, _ref3, _ref4, _ref5, _ref6,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  SkillView = (function(_super) {
    __extends(SkillView, _super);

    function SkillView() {
      _ref = SkillView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    SkillView.prototype.tagName = "div";

    SkillView.prototype.className = "skill-container";

    SkillView.prototype.qualityContainer = $(".quality-container");

    SkillView.prototype.template = $("#skill-template").html();

    SkillView.prototype.events = {
      "click": "overSkill",
      "focusout": "closeSkill"
    };

    SkillView.prototype.initialize = function() {
      return this.collection = new QualityCollection(this.model.toJSON().quality);
    };

    SkillView.prototype.render = function() {
      var tpl;
      tpl = _.template(this.template);
      this.$el.html(tpl(this.model.toJSON()));
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

  QualityView = (function(_super) {
    __extends(QualityView, _super);

    function QualityView() {
      _ref1 = QualityView.__super__.constructor.apply(this, arguments);
      return _ref1;
    }

    QualityView.prototype.template = $("#quality-template").html();

    QualityView.prototype.render = function() {
      var tpl;
      tpl = _.template(this.template);
      this.$el.html(tpl(this.model.toJSON()));
      return this;
    };

    return QualityView;

  })(Backbone.View);

  SkillModel = (function(_super) {
    __extends(SkillModel, _super);

    function SkillModel() {
      _ref2 = SkillModel.__super__.constructor.apply(this, arguments);
      return _ref2;
    }

    SkillModel.prototype.defaults = {
      thumbnail: "/images/unknown.png"
    };

    return SkillModel;

  })(Backbone.Model);

  SkillsCollection = (function(_super) {
    __extends(SkillsCollection, _super);

    function SkillsCollection() {
      _ref3 = SkillsCollection.__super__.constructor.apply(this, arguments);
      return _ref3;
    }

    SkillsCollection.prototype.model = SkillModel;

    return SkillsCollection;

  })(Backbone.Collection);

  QualityModel = (function(_super) {
    __extends(QualityModel, _super);

    function QualityModel() {
      _ref4 = QualityModel.__super__.constructor.apply(this, arguments);
      return _ref4;
    }

    QualityModel.prototype.defaults = {
      title: "",
      img: "",
      w: 128,
      h: 128
    };

    return QualityModel;

  })(Backbone.Model);

  QualityCollection = (function(_super) {
    __extends(QualityCollection, _super);

    function QualityCollection() {
      _ref5 = QualityCollection.__super__.constructor.apply(this, arguments);
      return _ref5;
    }

    QualityCollection.prototype.model = QualityModel;

    return QualityCollection;

  })(Backbone.Collection);

  ResumeView = (function(_super) {
    __extends(ResumeView, _super);

    function ResumeView() {
      _ref6 = ResumeView.__super__.constructor.apply(this, arguments);
      return _ref6;
    }

    ResumeView.prototype.el = $(".my-skills");

    ResumeView.prototype.initialize = function() {
      this.collection = new SkillsCollection(skills);
      return this.render;
    };

    ResumeView.prototype.render = function() {
      var that;
      that = this;
      return _.each(this.collection.models, function(item) {
        return that.renderSkill(item);
      }, this);
    };

    ResumeView.prototype.renderSkill = function(skill) {
      var skillView;
      skillView = new SkillView({
        model: skill
      });
      return this.$el.append(skillView.render().el);
    };

    return ResumeView;

  })(Backbone.View);

  window.Resume = new ResumeView();

}).call(this);