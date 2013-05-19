require "yummly/api"
require "yummly/connection"
require "yummly/configuration"
require "yummly/flavor"
require "yummly/image"
require "yummly/nutrition_estimate"
require "yummly/recipe"
require "yummly/source"
require "yummly/unit"
require "yummly/version"

module Yummly

  API_VERSION = 'v1'

  class << self

    attr_accessor :configuration

    def configure
      configuration = Yummly::Configuration.new
      yield(configuration)
      self.configuration = configuration
    end
  end
end
