define(
  [
    "config"
    "locales"
    "backgrounds"
    "views/resume"
    "views/locale"
    "views/background"
    "controller"
  ],
  (config, locales, backgrounds, ResumeView, LocaleView, Background, ResumeController) ->
    class BabenkoResume
      skills: {}
      constructor: () ->
        @skills = config
        @locales = locales
        @backgrounds = backgrounds
        @controller = new ResumeController(@)
        @resume = new ResumeView app: @

        window.Locale = new LocaleView(@)
        Locale.render()

        window.BackgoundView = new Background(@)
        BackgoundView.render()

        @resume.render()

        Backbone.history.start()

)