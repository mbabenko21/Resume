define(
  [
    "config"
    "locales"
    "views/resume"
    "views/locale"
    "controller"
  ],
  (config, locales, ResumeView, LocaleView, ResumeController) ->
    class BabenkoResume
      skills: {}
      constructor: () ->
        @skills = config
        @locales = locales
        @controller = new ResumeController(@)
        @resume = new ResumeView app: @

        window.Locale = new LocaleView(@)
        Locale.render()

        @resume.render()

        Backbone.history.start()

)