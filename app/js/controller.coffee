define [
  "views/pages/about_me"
  "views/pages/php"
  "views/pages/node_js"
  "views/pages/database"
  "views/pages/javascript"
  "views/pages/linux"
  "views/pages/git"
  "views/pages/contacts"
  "views/pages/portfolio"
], (
  AboutMeView
  PHPView
  NodeJSView
  DatabaseView
  JavascriptView
  LinuxView
  GitView
  ContactsView,
  PortfolioView
) ->
  class ResumeController extends Backbone.Router
    views: {}
    routes:
      "!/about-me": "aboutMe"
      "!/php": "php"
      "!/node.js": "nodeJS"
      "!/database": "database"
      "!/javascript": "javascript"
      "!/linux": "linux"
      "!/git": "git"
      "!/contact-me": "contacts"
      "!/portfolio": "portfolio"
    initialize: () ->
      @views.about_me = new AboutMeView()
      @views.php = new PHPView()
      @views.node_js = new NodeJSView()
      @views.database = new DatabaseView()
      @views.javascript = new JavascriptView()
      @views.linux = new LinuxView()
      @views.git = new GitView()
      @views.contacts = new ContactsView()
      @views.portfolio = new PortfolioView()
    aboutMe: () ->
       @views.about_me.render()
    php: () ->
      @views.php.render()
    nodeJS: () ->
      @views.node_js.render()
    database: () ->
      @views.database.render()
    javascript: () ->
      @views.javascript.render()
    linux: () ->
      @views.linux.render()
    git: () ->
      @views.git.render()
    contacts: () ->
      @views.contacts.render()
    portfolio: () ->
      @views.portfolio.render()
