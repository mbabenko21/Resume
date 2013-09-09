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
        "click": "changeSkill"
        "mouseover": "highLightShow"
        "mouseout": "highLightHide"
      initialize: (options) ->
        {@resume} = options
        @collection = new QualityCollection(@model.toJSON().quality)
        @router = new ResumeController()

      render: () ->
        @$el.html @template @model
        return @

      changeSkill: (event) ->
        @activate @model
        @resume.render()
        @router.navigate "!/"+@model.toJSON().link, trigger: true


      renderQualities: (quality) ->
        qualityView = new QualityView model: quality
        @qualityContainer.append qualityView.render().el
        @qualityContainer.show()

      highLightShow: () ->
        if @model.toJSON().active is no
          @showSkill(400)

      highLightHide: () ->
        if @model.toJSON().active is no
          @hideSkill(400)

      clearSkill: (model) ->
        el = $ "#" + model.get "id"
        #console.log el.find("img")
        el.find("img").first().removeClass("active")
        return el

      isActive: () ->
        /active/i.test @$el.attr('class')

      showSkill: (time = 0, model = @model) ->
        el = $ "#" + model.get "id"
        el.fadeTo(time, 1)

      hideSkill: (time = 0, model = @model) ->
        el = $ "#" + model.get "id"
        el.fadeTo(time, 0.5)

      activate: (model) ->
        oldActive = @resume.collection.findWhere active: true
        newActive = @resume.collection.findWhere id: model.get "id"
        oldActive.set active: false
        newActive.set active: true
        newActive.set class: "active"
        @showSkill 0, newActive
        @deactive oldActive

      deactive: (model) ->
        model.set(class: "")
        @hideSkill(0, model)
)