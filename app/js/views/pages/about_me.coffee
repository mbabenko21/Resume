define [
  'text!templates/page_content.html'
  'mdown!pages/about_me.md'
  'views/page_container'
], (template, am, PageContainer) ->
  class window.AboutMeView extends PageContainer
    template: _.template template
    page: _.template am