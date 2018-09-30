require 'spec_helper'

describe "JobOffersController" do

	describe 'get :new' do

	  it "should response ok and render job_offers/new" do
	  	expect_any_instance_of(JobVacancy::App).to receive(:render).with('job_offers/new')
	  	get '/job_offers/new'
	    expect(last_response).to be_ok
	  end

	 end

	describe 'post :create' do

		let(:current_user) do
			user = User.new
			user.id = 1
			user
		end

		it 'should call TwitterClient when create_and_twit is present' do
			expect_any_instance_of(JobVacancy::App).to receive(:current_user).and_return(current_user)
			expect_any_instance_of(JobOffer).to receive(:save).and_return(true)
			expect(TwitterClient).to receive(:publish)
			post '/job_offers/create', { :job_offer => {:title => 'Programmer offer' } , :create_and_twit => 'create_and_twit' }
			expect(last_response.location).to eq('http://example.org/job_offers/my')
		end

		it 'should not call TwitterClient when create_and_twit not present' do
			expect_any_instance_of(JobVacancy::App).to receive(:current_user).and_return(current_user)
			expect_any_instance_of(JobOffer).to receive(:save).and_return(true)
			expect(TwitterClient).not_to receive(:publish)
			post '/job_offers/create', { :job_offer => {:title => 'Programmer offer' } }
			expect(last_response.location).to eq('http://example.org/job_offers/my')
		end

	end

end
