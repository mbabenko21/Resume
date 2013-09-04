define([
    "collections/skills"
    "views/skill"
],
(SkillsCollection, SkillView) ->
  class ResumeView extends Backbone.View
    el: $(".resume-container")
    initialize: (app) ->
      @resume = app
      @collection = new SkillsCollection(app.skills)
      @render
    render: () ->
      that = @
      _.each(
        @collection.models,
        (item) -> that.renderSkill(item)
        @)
      @resume.controller.navigate "!/"+@collection.at(0).toJSON().link
      @$el.find(".skill").first().click()
      return @
    renderSkill: (skill) ->
      that = @
      skillView = new SkillView model: skill, router: that.resume.controller
      @$el.append skillView.render().el
)