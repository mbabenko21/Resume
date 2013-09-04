define([
  "collections/qualities"
  "views/quality"
  "text!templates/skill.html"
  "views/page"
  "controller"
  "models/page_title"
],
  (
    QualityCollection ,
    QualityView,
    template,
    PageTitleView,
    ResumeController,
    PageTitleModel
  ) ->
    class SkillView extends Backbone.View
      tagName: "div"
      className: "skill-container"
      qualityContainer: $(".quality-container")
      template: _.template template
      events:
        "click": "overSkill"
      initialize: () ->
        #console.log @model.toJSON().quality
        @collection = new QualityCollection(@model.toJSON().quality)
        @router = new ResumeController()
      render: () ->
        #console.log @template
        @$el.html @template @model.toJSON()
        return @
      overSkill: (event) ->
        @router.navigate "!/"+@model.toJSON().link
        @qualityContainer.find(".quality").remove()
        that = @
        cnt = @$el.find(".skill").data("src")
        #console.log @model.toJSON()
        _.each(
          @collection.models,
          (item) -> that.renderQualities(item)
          @)

        @pageTitle = new PageTitleView model: @model
        @changePageTitle(@model)
      renderQualities: (quality) ->
        qualityView = new QualityView model: quality
        @qualityContainer.append qualityView.render().el
        @qualityContainer.show()
      changePageTitle: (model) ->
        @pageTitle.model = model
        @pageTitle.render()
)