define [
  'text!templates/page.html'
], (template) ->
  class PageTitleView extends Backbone.View
    el: $(".page-title-container")
    template: _.template template
    render: () ->
      @$el.html @template @model.toJSON()
