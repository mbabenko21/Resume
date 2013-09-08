define [
  'text!templates/page_content.html'
  'mdown!pages/linux.md'
  'views/page_container'
], (template, linux, PageContainer) ->
  class LinuxView extends PageContainer
    template: _.template template
    page: _.template linux