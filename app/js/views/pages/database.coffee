define [
  'text!templates/page_content.html'
  'mdown!pages/database.md'
  'views/page_container'
], (template, db, PageContainer) ->
  class DatabaseView extends PageContainer
    template: _.template template
    page: _.template db