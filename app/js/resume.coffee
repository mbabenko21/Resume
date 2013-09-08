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
        @controller = new ResumeController()
        resume = new ResumeView(@)
        resume.render()

        locale = new LocaleView(@)
        locale.render()

        Backbone.history.start()

)