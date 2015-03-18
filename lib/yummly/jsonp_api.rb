# This class handles the JSONP interactions with the Yummly API.
module Yummly
  class JsonpApi
    include HTTParty
    parser JsonpParser

    #access searchValues of metadata dictionary for excludedIngredient[] &
    #allowedIngredient[] params for recipe searches.
    def self.ingredient
      list = Yummly::Connection.get("metadata/ingredient")
      Yummly::Ingredient.new(list)
    end

    #access searchValues of metadata dictionary for allowedAllergy[]
    #params for recipe searches.
    def self.allergy
      list = Yummly::Connection.get("metadata/allergy")
      Yummly::Allergy.new(list)
    end

    #access searchValues of metadata dictionary for allowedDiet[]
    #params for recipe searches.
    def self.diet
      list = get("metadata/diet")
      Yummly::Diet.new(list)
    end

  end
end
