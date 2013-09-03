define(
  [
    "config"
    "views/resume"
  ],
  (config, ResumeView) ->
    class BabenkoResume
      skills: {}
      constructor: () ->
        @skills = config
        resume = new ResumeView(@);
        resume.render()

)