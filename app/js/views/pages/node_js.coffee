define [
  'text!templates/page_content.html'
  'views/page_container'
], (template, PageContainer) ->
  class NodeJSView extends PageContainer
    template: _.template template
    pageFile: "node_js"