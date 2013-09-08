define ['models/locale'], (LocaleModel) ->
  class LocaleCollection extends Backbone.Collection
    model: LocaleModel