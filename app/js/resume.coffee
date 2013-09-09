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
        window.Locale = new LocaleView(@)
        Locale.render()

        @resume = new ResumeView app: @, locale: Locale
        @resume.render()

        Backbone.history.start()

)