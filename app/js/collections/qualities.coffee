define(["models/quality"],
  (QualityModel) ->
    class QualityCollection extends Backbone.Collection
      model: QualityModel
)