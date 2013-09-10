define ['text!templates/header.html'], (t) ->
  class HeaderView extends Backbone.View
    el: "#advert_text"
    template: _.template t

    ###events:
      "click": "hide"###

    render: () ->
      @$el.find("#page-title").html @template @model.toJSON()

    hide: (e) ->
      that = @
      time = if e isnt undefined then 1000 else 0
      @$el.animate {"margin-top": "-50"}, time, () ->
        that.delegateEvents "click": "show"
        that.createButton()

    show: (e) ->
      that = @
      @$el.animate {"margin-top": "0"}, 1000, () ->
        that.delegateEvents "click": "hide"

    createButton: () ->
      console.log @$el.find(".row").find("div").first()



