# This enumerable class maps a Yummly search response to a set of recipe objects and includes meta data related to
# the overall search result, such as total match count.
#
# TODO: Make this class scrollable, allowing it to page through the results easily via next and previous, e.g.
module Yummly
  class SearchResult

    include Enumerable

    attr_accessor :response, :params, :max_result, :start

    def initialize(response)
      @response = response
    end

    def each(&block)
      recipes.each(&block)
    end

    def recipes
      @recipes ||= matches.collect { |recipe_json| Yummly::Recipe.new(recipe_json) }
    end

    def matches
      response["matches"] || []
    end

    def total_match_count
      response["totalMatchCount"]
    end
    alias_method :total, :total_match_count

    def attribution
      Yummly::Attribution.new(response["attribution"])
    end

    def criteria
      response["criteria"]
    end

  end
end