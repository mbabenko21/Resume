define [], () ->
  class PageModel extends Backbone.Model
    defaults:
      html: "<h1>It's empty page</h1>"