define([
  "text!templates/quality.html"
],
  (template) ->
    class QualityView extends Backbone.View
      template: _.template template
      render: () ->
        #console.log @template
        @$el.html @template @model.toJSON()
        return @
)