define [
  'text!templates/page_content.html'
  'views/page_container'
], (template, PageContainer) ->
  class JavascriptView extends PageContainer
    template: _.template template
    pageFile: "javascript"