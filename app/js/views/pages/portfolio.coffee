define [
  'text!templates/page_content.html'
  'mdown!pages/portfolio.md'
  'views/page_container'
], (template, portfolio, PageContainer) ->
  class PortfolioView extends PageContainer
    template: _.template template
    page: _.template portfolio