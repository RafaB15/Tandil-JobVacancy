require 'spec_helper'

describe "HealthController" do

  it "should check database and return ok" do
  	Ping.stub(:create).and_return(Ping.new)
  	get '/health'
    last_response.should be_ok
  end

end
