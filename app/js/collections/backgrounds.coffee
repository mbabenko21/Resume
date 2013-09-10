define ['models/background'], (BackgroundModel) ->
  class BackgroundsCollection extends Backbone.Collection
    model: BackgroundModel