define(["models/skill"], (SkillModel) ->
  class SkillsCollection extends Backbone.Collection
    model: SkillModel
)