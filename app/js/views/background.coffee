define ['collections/backgrounds'], (BackgroundsCollection) ->
  class Background extends Backbone.View
    el: "body"
    initialize: (app) ->
      @collection = new BackgroundsCollection app.backgrounds

    render: () ->
      model = @collection.findWhere active: true
      @model = model
      @$el.css("background", 'url("' + model.toJSON().url + '")')

    changeBackground: (model) ->
      @collection.findWhere(active: true).set(active: false)
      @collection.findWhere(url: model.toJSON().url).set(active: true)
      @model = model
      @render()

    random: () ->
      number = Math.floor((Math.random()*@collection.length))
      model = @collection.at(number)
      @changeBackground(model)