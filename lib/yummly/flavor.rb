# Contains the flavor scores for a recipe, each on a range from 0 to 1.
class Yummly::Flavor

  attr_accessor :spiciness,
                :bitterness,
                :sweetness,
                :savoriness,
                :saltiness,
                :sourness

  def initialize(values)
    @spiciness = values["spicy"]
    @bitterness = values["bitter"]
    @sweetness = values["sweet"]
    @savoriness = values["meaty"]
    @sourness = values["sour"]
  end

end