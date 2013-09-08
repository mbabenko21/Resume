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
      @collection = new LocaleCollection app.locales
      @render

    render: () ->
      that = @
      _.each @collection.models, (locale) ->
        that.$el.append that.template locale.toJSON()

    change: (event) ->
      @clear()
      $(event.target).addClass("circle").addClass("text-danger")

    clear: () ->
      @$el.find(".circle").removeClass("circle").removeClass("text-danger");
