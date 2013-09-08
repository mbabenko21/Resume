define [
  'text!templates/page_content.html'
  'mdown!pages/php.md'
  'views/page_container'
], (template, php, PageContainer) ->
  class PHPView extends PageContainer
    template: _.template template
    page: _.template php
