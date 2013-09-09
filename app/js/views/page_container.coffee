define [
  'models/page'
  'text!templates/page_content.html'
], (PageModel, template) ->
  class PageContainer extends Backbone.View
    el: ".page-container"
    tagName: "div"
    className: "look"
    page: _.template ""
    initialize: () ->
      @model = new PageModel
      @$el.find("#page_content").val ''

    renderPage: () ->
      #console.log @model.toJSON()
      @$el.html @template @model.toJSON()
    render: () ->
      @setPage(@pageFile)

    setPage: (pageFile) ->
      that = @
      locale = Locale.locale.toJSON().link
      returnPage = ""
      require(
        ["mdown!pages/"+locale+"/"+pageFile+".md"],
      (page) ->
        returnPage = _.template page
        model = new PageModel html: returnPage()
        that.$el.html that.template model.toJSON()
        that.$el.find('a').attr('target', '_blank')
      )