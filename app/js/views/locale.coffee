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
      @render

    render: () ->
      that = @
      _.each @collection.models, (locale) ->
        that.$el.append that.template locale

    change: (event) ->
      id = $(event.target).attr "id"
      @clear()
      @setLocale id
      $(event.target).addClass("circle").addClass("text-danger")
      @app.resume.render()

    clear: () ->
      locale = @collection.findWhere({active: true})
      if locale isnt undefined
        locale.set({active: false})
      el = @$el.find "#"+locale.toJSON().link
      el.removeClass("circle").removeClass("text-danger");

    setLocale: (id) ->
      model = @collection.findWhere link: id
      if model isnt undefined
        model.set({active: true})
      @locale = model
