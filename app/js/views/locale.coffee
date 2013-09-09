define [
  'text!templates/locale.html'
  'collections/locales'
], (template, LocaleCollection) ->
  class LocaleView extends Backbone.View
    el: "#locale-container"
    template: _.template template

    events:
      "click": "change"

    initialize: (app) ->
      @app = app
      @collection = new LocaleCollection app.locales

    render: () ->
      that = @
      _.each @collection.models, (locale) ->
        that.$el.append that.template locale
      @select(@collection.findWhere active: true)
      return @


    change: (event) ->
      id = $(event.target).attr "id"
      @select(@collection.findWhere link: id)
      @app.resume.render()

    clear: () ->
      locale = @collection.findWhere({active: true})
      if locale isnt undefined
        locale.set({active: false})
      el = @$el.find "#"+locale.toJSON().link
      el.removeClass("circle").removeClass("text-danger");

    select: (model = @model) ->
      @clear()
      @collection.findWhere({link: model.toJSON().link}).set({active: true})
      el = $ "#" + model.toJSON().link
      el.addClass("circle").addClass("text-danger")
      @setLocale model.toJSON().link
      activeModel = @app.resume.collection.findWhere({active: true})
      console.log activeModel.toJSON().link
      @app.controller.navigate "!//" + activeModel.toJSON().link, {trigger: true}



    setLocale: (id) ->
      model = @collection.findWhere link: id
      if model isnt undefined
        model.set({active: true})
      @locale = model
