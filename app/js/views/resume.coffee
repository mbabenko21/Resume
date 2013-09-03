define([
    "collections/skills"
    "views/skill"
],
(SkillsCollection, SkillView) ->
  class ResumeView extends Backbone.View
    el: $(".resume-container")
    initialize: (app) ->
      @collection = new SkillsCollection(app.skills)
      @render
    render: () ->
      that = @
      _.each(
        @collection.models,
        (item) -> that.renderSkill(item)
        @)
    renderSkill: (skill) ->
      skillView = new SkillView model: skill
      @$el.append skillView.render().el
)