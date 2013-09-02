class SkillModel extends Backbone.Model
  defaults:
    thumbnail: "/images/unknows.png"

class SkillsCollection extends Backbone.Collection
  model: SkillModel