define([
    "collections/skills"
    "views/skill"
    "views/page"
    "views/header"
    "models/header"
    "controller"
],
(SkillsCollection, SkillView, PageTitleView, HeaderView, HeaderModel, ResumeController) ->
  class ResumeView extends Backbone.View
    el: $(".resume-container")
    events:
      "mouseover": "over"
    initialize: (options) ->
      {@app, @locale} = options
      @collection = new SkillsCollection @app.skills
      @router = new ResumeController()
      @render
    # Очистить площадку
    # Отрендерить все скиллы
    # Найти активную модель (active: true)
    # Активировать скилл
    # Изменить титл страницы
    # Изменить адресс url
    render: () ->
      @$el.html ""
      @setHeader()
      @renderAllSkills()
      @changePageTitle()
      model = @collection.findWhere active: true
      #TODO Заглушка! Необходимо найти решение!!!
      window.location.hash = "!/"+model.toJSON().link
      return @

    renderAllSkills: () ->
      that = @
      _.each(
        @collection.models,
        (item) -> that.renderOneSkill(item)
        @
      )

    renderOneSkill: (skill) ->
      that = @
      skillView = new SkillView model: skill, resume: that
      @$el.append skillView.render().el
      skillView.hideSkill()
      if skill.toJSON().active is on
        skillView.showSkill()



    activateSkill: (model) ->
      el = $ "#"+model.get("id")
      el.find("img").addClass("active").fadeTo(0, 1);

    changePageTitle: () ->
      model = @collection.findWhere active: true
      pt = new PageTitleView model: model
      pt.render()


    setHeader: () ->
      model = new HeaderModel()
      header = new HeaderView model: model
      header.render()
      $("title").text(model.toJSON().title[Locale.locale.toJSON().link])
)