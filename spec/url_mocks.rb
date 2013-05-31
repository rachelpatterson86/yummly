module UrlMocks
  def self.register_api_url_stubs
    File.open(File.join(File.dirname(__FILE__), "fixtures", "search_response.txt")) do |file|
      WebMock::API.stub_request(:get, Regexp.new(Yummly::Connection.domain + "/v1/api/recipes?" + ".*")).to_return(status: 200, body: file)
    end
    #stub_request(:any, Regexp.new(Yummly::Connection.domain + ".*")).to_return(:body => "Catch all error until urls are defined.", :status => 501 )
  end
end