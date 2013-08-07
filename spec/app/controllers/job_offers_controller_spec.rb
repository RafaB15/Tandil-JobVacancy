require 'spec_helper'

describe "JobOffersController" do

	describe 'get :new' do
		
	  it "should response ok and render job_offers/new" do
	  	JobVacancy::App.any_instance.should_receive(:render).with('job_offers/new')
	  	get '/job_offers/new'
	    last_response.should be_ok
	  end

	 end

	describe 'post :create' do

		let(:current_user) do
			user = User.new
			user.id = 1
			user
		end

		it 'should call TwitterClient when create_and_twit is present' do
			JobVacancy::App.any_instance.stub(:current_user).and_return(current_user)
			JobOffer.any_instance.stub(:save).and_return(true)
			TwitterClient.should_receive(:publish)
			post '/job_offers/create', { :job_offer => {:title => 'Programmer offer' } , :create_and_twit => 'create_and_twit' }
			last_response.location.should == 'http://example.org/job_offers/my'
		end

		it 'should not call TwitterClient when create_and_twit not present' do
			JobVacancy::App.any_instance.stub(:current_user).and_return(current_user)
			JobOffer.any_instance.stub(:save).and_return(true)
			TwitterClient.should_not_receive(:publish)
			post '/job_offers/create', { :job_offer => {:title => 'Programmer offer' } }
			last_response.location.should == 'http://example.org/job_offers/my'
		end

	end

end
