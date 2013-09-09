define([
    "collections/skills"
    "views/skill"
    "views/page"
    "controller"
],
(SkillsCollection, SkillView, PageTitleView, ResumeController) ->
  class ResumeView extends Backbone.View
    el: $(".resume-container")
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
      el = $("#advert_text")
      if Locale.locale.toJSON().link is "ru"
        el.find("h3").text("Резюме WEB-разработчика")
      else
        el.find("h3").text("WEB-developer resume")
)