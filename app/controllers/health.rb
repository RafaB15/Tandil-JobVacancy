JobVacancy::App.controllers :health do
  
  get :index do
    ping = Ping.create(:description => 'health-controller')
    ping.nil?? 500 : 'ok'
  end

  get :stats do
    content_type:'json'
    { offers_count: JobOffer.count, users_count: User.count }.to_json
  end

  get :version do
  	Version.current
  end

  get :reset do
    JobOffer.destroy
    Ping.destroy
    User.destroy
    user = User.create(:email => 'offerer@test.com',
                   :name => 'Offerer', 
                   :password => "Passw0rd!")
    JobOffer.create(:title => 'Java programmer',
                    :description => 'Spring experience required',
                    :location => 'Cordoba')
    JobOffer.create(:title => 'Web programmer',
                    :description => 'HTML5 experience required',
                    :location => 'Rosario')
    'ok'
  end


    @job_offer = JobOffer.new(params[:job_offer])
    @job_offer.owner = current_user
    if @job_offer.save
      if params['create_and_twit']
        TwitterClient.publish(@job_offer)
      end
      flash[:success] = 'Offer created'
      redirect '/job_offers/my'
    else
      flash.now[:error] = 'Title is mandatory'
      render 'job_offers/new'
    end  


end
