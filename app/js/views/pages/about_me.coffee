define [
  'text!templates/page_content.html'
  'views/page_container'
], (template, PageContainer) ->
  class window.AboutMeView extends PageContainer
    template: _.template template
    pageFile: "about_me"

