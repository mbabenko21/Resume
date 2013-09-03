define([
  "collections/qualities"
  "views/quality"
  "text!templates/skill.html"
],
  (QualityCollection ,QualityView, template) ->
    class SkillView extends Backbone.View
      tagName: "div"
      className: "skill-container"
      qualityContainer: $(".quality-container")
      template: _.template template
      events:
        "click": "overSkill"
        "focusout": "closeSkill"
      initialize: () ->
        #console.log @model.toJSON().quality
        @collection = new QualityCollection(@model.toJSON().quality)
      render: () ->

        #console.log @template
        @$el.html @template @model.toJSON()
        return @
      overSkill: (event) ->
        @qualityContainer.find(".quality").remove()
        that = @
        cnt = @$el.find(".skill").data("src")
        #console.log @model.toJSON()
        _.each(
          @collection.models,
          (item) -> that.renderQualities(item)
          @)

      renderQualities: (quality) ->
        qualityView = new QualityView model: quality
        @qualityContainer.append qualityView.render().el
        @qualityContainer.show()
)