# The implied unit of measure for a nutrition estimate.
class Yummly::Unit

  # Single unit display name for unit of measure.
  attr_accessor :name

  # Single unit abbreviation for unit of measure.
  attr_accessor :abbreviation

  # Plural display name for unit of measure.
  attr_accessor :plural

  # Plural unit abbreviation for unit of measure.
  attr_accessor :plural_abbreviation

  def initialize(values)
    @name = values["name"]
    @abbreviation = values["abbreviation"]
    @plural = values["plural"]
    @plural_abbreviation = values["pluralAbbreviation"]
  end

end