define(
  [
    "config"
    "views/resume"
    "views/lang"
    "controller"
    "langs"
  ],
  (config, ResumeView, LangView, ResumeController, langs) ->
    class BabenkoResume
      skills: {}
      constructor: () ->
        @skills = config
        @langs = langs
        @controller = new ResumeController()
        resume = new ResumeView(@)
        resume.render()

        lang = new LangView(@)
        lang.render()

        Backbone.history.start()

)