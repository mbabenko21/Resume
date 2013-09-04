requirejs.config
  baseUrl: 'js'
  paths:
    text: 'lib/text'
    markdownConverter : 'lib/requirejs-plugins/lib/Markdown.Converter'
    mdown: 'lib/requirejs-plugins/src/mdown'
  shim:
    'lib/underscore-min':
      exports: '_'
    'lib/backbone-min':
      deps: ['lib/underscore-min']
      exports: 'Backbone'
    'resume':
      deps: ['lib/underscore-min', 'lib/backbone-min']

require(["resume"],
  (BabenkoResume) ->
    window.BabenkoResume = new BabenkoResume()
    $('body').find(".skill-container").first().click()
    hljs.initHighlighting()
)