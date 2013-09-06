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
        "mouseover": "highLightShow"
        "mouseout": "highLightHide"
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

        $("body").find(".opacity-100").addClass('opacity-70').removeClass('opacity-100').removeClass("active").fadeTo(400, 0.5)
        $("body").find(".skill.opacity-70").removeClass('opacity-70').removeClass("active")
        $(event.target).removeClass('opacity-70').addClass('opacity-100').addClass("active").fadeTo(0, 1)

        @router.navigate "!/"+@model.toJSON().link, {trigger: true}
        @changePageTitle(@model)
      renderQualities: (quality) ->
        qualityView = new QualityView model: quality
        @qualityContainer.append qualityView.render().el
        @qualityContainer.show()
      changePageTitle: (model) ->
        @pageTitle.model = model
        @pageTitle.render()

      highLightShow: () ->
        that = @
        if(@isActive() is false)
          @clearSkill(@$el).fadeTo(400, 1)

      highLightHide: () ->
        if(@isActive() is false)
          @clearSkill(@$el).fadeTo(400, 0.5)
        #@$el.css("background-color", "")
      clearAllSkills: () ->
        that = @
        list = $('body').find('img')

      clearSkill: (el) ->
        img = el.find("img").first()
        img.removeAttr "class"
        return img

      isActive: () ->
        /active/i.test @$el.find("img").first().attr('class')
      activate: (el) ->
        @clearSkill(el).addClass("opacity-100").addClass("active")
      deactive: (el) ->
        @clearSkill(el).addClass("opacity-70")
)