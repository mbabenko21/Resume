define [
  'models/page'
  'text!templates/page_content.html'
], (PageModel, template) ->
  class PageContainer extends Backbone.View
    el: ".page-container"
    tagName: "div"
    className: "look"
    initialize: () ->
      @model = new PageModel
      @$el.find("#page_content").val ''
    setTpl: (t) ->
      tpl = _.template t
      @model.set html: tpl()
    renderPage: () ->
      @$el.html @template @model.toJSON()
    render: () ->
      @model.set html: @page()
      @renderPage()
      @$el.find('a').attr('target', '_blank')