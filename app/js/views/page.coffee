define [
  'text!templates/page.html'
], (template) ->
  class PageTitleView extends Backbone.View
    el: ".page-title-container"
    template: _.template template
    render: () ->
      that = @
      p = @$el.find("p").first()
      if p.html() isnt undefined
        p.animate "margin-left": "-2000px", 1000, () ->
          that.$el.html that.template that.model.toJSON()
          that.show()
      else
        @$el.html @template @model.toJSON()
        @show()

    hide: () ->
      p = @$el.find("p").first()
      if p.html() isnt undefined
        p.animate "margin-left": "-2000px", 500

    show: () ->
      p = @$el.find("p").first()
      if p.html() isnt undefined
        p.animate "margin-right": "0px", 500
