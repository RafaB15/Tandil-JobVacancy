require 'spec_helper'

describe "SessionsController" do

	describe 'get :' do
		
	  it "should response ok" do
	  	JobVacancy::App.any_instance.should_receive(:render).with('sessions/new')
	  	get '/login'
	    last_response.should be_ok
	  end

	  it 'should render users/login' do
	  	JobVacancy::App.any_instance.should_receive(:render).with('sessions/new')
	  	get '/login'
	  end

  end
end
