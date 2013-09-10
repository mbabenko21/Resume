define([], () ->
  class SkillModel extends Backbone.Model
    defaults:
      thumbnail: "/images/unknown.png"
      w: 85
      h: 85
      active: false
      class: ""
)