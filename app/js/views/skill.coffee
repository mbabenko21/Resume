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


      ###renderQualities: (quality) ->
        qualityView = new QualityView model: quality
        @qualityContainer.append qualityView.render().el
        @qualityContainer.show()###

      # Подсветка при наведении
      highLightShow: () ->
        if @model.toJSON().active is no
          @showSkill(400)

      # Подсветка при опускании
      highLightHide: () ->
        if @model.toJSON().active is no
          @hideSkill(400)
      # Очистка
      # @deprecated
      clearSkill: (model) ->
        el = $ "#" + model.get "id"
        el.find("img").first().removeClass("active")
        return el

      # Активен ли текущий элемент
      isActive: () ->
        /active/i.test @$el.attr('class')

      # Анимация возгорания
      showSkill: (time = 0, model = @model) ->
        el = $ "#" + model.get "id"
        el.fadeTo(time, 1)
      # Анимация затухания
      hideSkill: (time = 0, model = @model) ->
        el = $ "#" + model.get "id"
        el.fadeTo(time, 0.5)

      # Активация
      activate: (model) ->
        oldActive = @resume.collection.findWhere active: true
        newActive = @resume.collection.findWhere id: model.get "id"
        oldActive.set active: false
        newActive.set active: true
        newActive.set class: "active"
        @showSkill 0, newActive
        @deactive oldActive

      # Деактивация модели
      deactive: (model) ->
        model.set(class: "")
        @hideSkill(0, model)
)