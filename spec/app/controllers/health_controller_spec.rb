require 'spec_helper'

describe "HealthController" do

  it "should check database and return ok" do
  	Ping.stub(:create).and_return(Ping.new)
  	get '/health'
    last_response.should be_ok
  end

  it 'should version should include BUILD_NUMBER' do
  	ENV['BUILD_NUMBER'] = '1'
  	get '/health/version'
  	expect(last_response.body.include?('.1')).to eq(true)
  end

end
