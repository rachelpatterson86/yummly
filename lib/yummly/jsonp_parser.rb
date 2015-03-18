module Yummly

  class JsonpParser < HTTParty::Parser
    SupportedFormats = {"text/javascript" => :jsonp}

    def jsonp
      binding.pry
      JSON.load(body[2..-11], nil)
    end

  end

end
