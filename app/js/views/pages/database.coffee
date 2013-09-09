define [
  'text!templates/page_content.html'
  'views/page_container'
], (template, PageContainer) ->
  class DatabaseView extends PageContainer
    template: _.template template
    pageFile: "database"