define [
  'text!templates/page_content.html'
  'mdown!pages/node_js.md'
  'views/page_container'
], (template, nj, PageContainer) ->
  class NodeJSView extends PageContainer
    template: _.template template
    page: _.template nj