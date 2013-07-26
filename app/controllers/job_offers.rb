JobVacancy::App.controllers :job_offers do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  get '/new' do
    @job_offer = JobOffer.new
    render 'job_offers/new'
  end
  
  post :create do
    title = params[:job_offer][:title]
    @job_offer = JobOffer.new
    @job_offer.title = title
    @job_offer.save
    render 'job_offers/show'          
  end

end
