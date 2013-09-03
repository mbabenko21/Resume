
class SkillView extends Backbone.View
  tagName: "div"
  className: "skill-container"
  qualityContainer: $(".quality-container")
  template: $("#skill-template").html()
  events:
    "click": "overSkill"
    "focusout": "closeSkill"
  initialize: () ->
    #console.log @model.toJSON().quality
    @collection = new QualityCollection(@model.toJSON().quality)
  render: () ->
    tpl = _.template @template
    #console.log @template
    @$el.html tpl @model.toJSON()
    return @
  overSkill: (event) ->
    @qualityContainer.find(".quality").remove()
    that = @
    cnt = @$el.find(".skill").data("src")
    #console.log @model.toJSON()
    _.each(
      @collection.models,
      (item) -> that.renderQualities(item)
      @
    )

  renderQualities: (quality) ->
     qualityView = new QualityView model: quality
     @qualityContainer.append qualityView.render().el
     @qualityContainer.show()
     #console.log quality.toJSON();
####################################################
class QualityView extends Backbone.View
  template: $("#quality-template").html()
  render: () ->
    tpl = _.template @template
    #console.log @template
    @$el.html tpl @model.toJSON()
    return @
#######################################################
class SkillModel extends Backbone.Model
  defaults:
    thumbnail: "/images/unknown.png"
#######################################################
class SkillsCollection extends Backbone.Collection
  model: SkillModel
#######################################################
class QualityModel extends Backbone.Model
  defaults:
    title: ""
    img: ""
    w: 128,
    h: 128
#######################################################
class QualityCollection extends Backbone.Collection
  model: QualityModel
#######################################################
class ResumeView extends Backbone.View
  el: $(".my-skills")
  initialize: () ->
    @collection = new SkillsCollection(skills)
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
#########################################################

window.Resume = new ResumeView()


