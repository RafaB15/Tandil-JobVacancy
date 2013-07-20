require 'spec_helper'

describe "UsersController" do

	describe 'get :new' do
		
	  it "should response ok" do
	  	JobVacancy::App.any_instance.should_receive(:render).with('users/new')
	  	get '/users/new'
	    last_response.should be_ok
	  end

	  it 'should response render users/new' do
	  	JobVacancy::App.any_instance.should_receive(:render).with('users/new')
	  	get '/users/new'
	  end

	 end

	 describe 'post :new' do

	 end
	 
end
