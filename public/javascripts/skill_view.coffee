class SkillView extends Backbone.View
  tagName: "article"
  className: "skill-container"
  template: $("#skill-template").html()
  render: () ->
      tpl = _.template @template
      @$el.html tpl @model.toJSON()
      return @
