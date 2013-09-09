define [
  'text!templates/page_content.html'
  'views/page_container'
], (template, PageContainer) ->
  class ContactsView extends PageContainer
    template: _.template template
    pageFile: "contacts"