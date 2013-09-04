define(
  [
    "config"
    "views/resume"
    "controller"
  ],
  (config, ResumeView, ResumeController) ->
    class BabenkoResume
      skills: {}
      constructor: () ->
        @skills = config
        @controller = new ResumeController()
        resume = new ResumeView(@)
        resume.render()

        Backbone.history.start()

)