define [
  'text!templates/page_content.html'
  'mdown!pages/contacts.md'
  'views/page_container'
], (template, contacts, PageContainer) ->
  class ContactsView extends PageContainer
    template: _.template template
    page: _.template contacts