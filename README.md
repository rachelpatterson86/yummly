# Yummly

This is the unofficial ruby wrapper to the Yummly API, "the world's largest and most powerful recipe search site".

https://developer.yummly.com/

Still in the baking phase. Tests are being written, lots of churn at the moment.

## Installation

Add this line to your application's Gemfile:

    gem 'yummly'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yummly

## Configuration

First, configure Yummly with your APP key and ID, for example in an initializer if you're using Rails:

    Yummly.configure do |config|
      config.app_id = "21334"
      config.app_key = "XXXXXXXXXXXXXXXXX"
      config.use_ssl = true # Default is false
    end

_Note: HTTPS API access is only available on some paid Yummly plans._

## API calls

Once configured, you have access to two API calls:

#### Search

The search command returns an array of Yummly::Recipe objects:

    Yummly::Api.search('Onion soup')

#### Find

The find command returns a single Yummly::Recipe object:

    Yummly::Api.find('French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364')

## The Recipe object

The Yummly ruby wrapper returns all results as recipe objects. These objects normalize the API responses to make it
easier for developers to interact with recipes from ruby. All Yummly recipe attributes have been directly mapped, and
in cases where the JSON response returned an array for a specific attribute and array of related objects are returned
from the ruby Recipe object.

For example, to access the thumbnail image for a recipe:

    recipe = Yummly::Api.find('French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364')
    recipe.images.first.small_url

Explore the Yummly::Recipe class to see the full range of available attributes.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
