require "spec_helper"

describe Yummly do

  describe ".configure" do
    let(:app_id) { ENV['YUMMLY_APP_ID'] || "12345" }
    let(:app_key) { ENV['YUMMLY_APP_KEY'] || "XEARSGSTH12345789" }

    before do
      Yummly.configure do |config|
        config.use_ssl = true
        config.app_id = app_id
        config.app_key = app_key
      end

    end

    specify { Yummly.configuration.use_ssl?.should be_true }
    specify { Yummly.configuration.app_id.should == app_id }
    specify { Yummly.configuration.app_key.should == app_key }
    specify { Yummly.search("soup recipes").should be_an_instance_of(Array)}
  end

end