define([], () ->
  class SkillModel extends Backbone.Model
    defaults:
      thumbnail: "/images/unknown.png"
      w: 96
      h: 96
      active: false
      class: ""
)