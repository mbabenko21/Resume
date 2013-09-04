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
        @$el.html @template @model
        return @
      overSkill: (event) ->
        @pageTitle = new PageTitleView model: @model
        @qualityContainer.find(".quality").remove()
        that = @
        _.each(
          @collection.models,
          (item) -> that.renderQualities(item)
          @
        )
        $(".skill-container").find(".opacity-100").addClass('opacity-70').removeClass('opacity-100')
        $(event.target).removeClass('opacity-70').addClass('opacity-100')
        @router.navigate "!/"+@model.toJSON().link, {trigger: true}
        @changePageTitle(@model)
      renderQualities: (quality) ->
        qualityView = new QualityView model: quality
        @qualityContainer.append qualityView.render().el
        @qualityContainer.show()
      changePageTitle: (model) ->
        @pageTitle.model = model
        @pageTitle.render()
)