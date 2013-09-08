define [
  'text!templates/page_content.html'
  'mdown!pages/javascript.md'
  'views/page_container'
], (template, js, PageContainer) ->
  class JavascriptView extends PageContainer
    template: _.template template
    page: _.template js