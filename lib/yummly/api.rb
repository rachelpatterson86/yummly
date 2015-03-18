# This class is the primary mechanism to execute Yummly API calls.
#
# Currently Yummly only has two public API calls: one for searching recipes and the other to retrieve a specific recipe.
#
# @example
#   Yummly::Api.find('French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364')
# @example
#   Yummly::Api.search('Onion soup')

module Yummly
  class Api

    # Retrieves a single recipe.
    #
    # @param [String] id The yummly recipe identifier.
    # @return [Yummly::Recipe] a instance of a recipe object
    # @example
    #   recipe = Yummly::Api.find('French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364')
    def self.find(id)
      recipe_json = Yummly::Connection.get("recipe/#{id}")
      recipe_json.nil? ? nil : Yummly::Recipe.new(recipe_json)
    end

    # Searches for recipes that match the supplied search terms.
    #
    # @param [String] terms A string of terms used to search API
    # @param [Hash] params Additional options to pass to the search API
    # @return [Yummly::SearchResult] an enumerable search result object
    # @example
    #   recipes = Yummly::Api.search('Onion soup')
    def self.search(terms, params = {})
      params[:q] = terms unless params.has_key?(:q)
      result = Yummly::Connection.get("recipes", params)
      Yummly::SearchResult.new(result)
    end

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
      list = Yummly::Connection.get("metadata/diet")
      Yummly::Diet.new(list)
    end

  end
end
