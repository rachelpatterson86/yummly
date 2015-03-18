# Contains details about the origin of the recipe.
module Yummly
  class Diet

    attr_accessor :json

    def initialize(json)
      @json = json
    end

    # @return [String] the Yummly id for this ingredient.
    def id
      json["id"]
    end

    # @return [String] the Yummly shortDescription for this ingredient.
    def short_description
      json["shortDescription"]
    end

    # @return [String] the Yummly longDescription for this ingredient.
    def long_description
      json["longDescription"]
    end

    def search_value
      json["searchValue"]
    end

    def type
      json["type"]
    end

    def locales_available_in
      json["localesAvailableIn"]
    end



    # # The original source url of this recipe.
    # attr_accessor :recipe_url
    #
    # # The url of the source site of this recipe.
    # attr_accessor :site_url
    #
    # # The display name of the source site.
    # attr_accessor :display_name
    #
    # def initialize(values)
    #   @recipe_url = values["sourceRecipeUrl"]
    #   @site_url = values["sourceSiteUrl"]
    #   @display_name= values["sourceDisplayName"]
    # end

  end
end
