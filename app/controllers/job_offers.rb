CONFIRMATION_OF_INFORMATION_SENT_MESSAGE = 'Contact information sent.'.freeze
SUCCESFUL_CREATION_MESSAGE = 'Offer created'.freeze
CREATION_ERROR_MESSAGE = 'Please review the errors'.freeze
UPDATE_ERROR_MESSAGE = 'Please review the errors'.freeze
SUCCESFUL_UPDATE_MESSAGE = 'Offer updated'.freeze
CV_LINK_ERROR_MESSAGE = 'Invalid CV link'.freeze
DESCRIPTION_ERROR_MESSAGE = 'Invalid description minimum 10 characters and maximum 500 characters'.freeze

JobVacancy::App.controllers :job_offers do
  get :my do
    @offers = JobOfferRepository.new.find_by_owner(current_user)
    render 'job_offers/my_offers'
  end

  get :index do
    @offers = JobOfferRepository.new.all_active
    render 'job_offers/list'
  end

  get :new do
    @job_offer = JobOfferForm.new
    render 'job_offers/new'
  end

  get :latest do
    @offers = JobOfferRepository.new.all_active
    render 'job_offers/list'
  end

  get :edit, with: :offer_id do
    @job_offer = JobOfferForm.from(JobOfferRepository.new.find(params[:offer_id]))
    # TODO: validate the current user is the owner of the offer
    render 'job_offers/edit'
  end

  get :apply, with: :offer_id do
    @job_offer = JobOfferForm.from(JobOfferRepository.new.find(params[:offer_id]))
    @job_application = JobApplicationForm.new
    # TODO: validate the current user is the owner of the offer
    render 'job_offers/apply'
  end

  post :search do
    @offers = JobOfferRepository.new.search_by_title(params[:q])
    render 'job_offers/list'
  end

  post :apply, with: :offer_id do
    @job_offer = JobOfferRepository.new.find(params[:offer_id])
    applicant_email = params[:job_application_form][:applicant_email]
    cv_link = params[:job_application_form][:cv_link]
    description = params[:job_application_form][:description]

    @job_application = JobApplication.create_for(applicant_email, @job_offer, cv_link, description)
    @job_application.process

    flash[:success] = CONFIRMATION_OF_INFORMATION_SENT_MESSAGE
    redirect '/job_offers'
  rescue ActiveModel::ValidationError => e
    @job_offer = JobOfferForm.from(JobOfferRepository.new.find(params[:offer_id]))
    @job_application = JobApplicationForm.new

    if e.model.errors.key?('cv_link') # to-do constante
      error_message = CV_LINK_ERROR_MESSAGE
    elsif e.model.errors.key?('description') # to-do constante
      error_message = DESCRIPTION_ERROR_MESSAGE
    end
    flash.now[:error] = error_message
    render 'job_offers/apply'
  end

  post :create do
    job_offer = JobOffer.new(job_offer_params)
    job_offer.owner = current_user
    if JobOfferRepository.new.save(job_offer)
      flash[:success] = SUCCESFUL_CREATION_MESSAGE
      redirect '/job_offers/my'
    end
  rescue ActiveModel::ValidationError => e
    @job_offer = JobOfferForm.new
    @errors = e.model.errors
    flash.now[:error] = CREATION_ERROR_MESSAGE
    render 'job_offers/new'
  end

  post :update, with: :offer_id do
    @job_offer = JobOffer.new(job_offer_params.merge(id: params[:offer_id]))
    @job_offer.owner = current_user

    if JobOfferRepository.new.save(@job_offer)
      flash[:success] = SUCCESFUL_UPDATE_MESSAGE
      redirect '/job_offers/my'
    end
  rescue ActiveModel::ValidationError => e
    @job_offer = JobOfferForm.new
    @errors = e.model.errors
    flash.now[:error] = UPDATE_ERROR_MESSAGE
    render 'job_offers/edit'
  end

  put :activate, with: :offer_id do
    @job_offer = JobOfferRepository.new.find(params[:offer_id])
    @job_offer.activate
    if JobOfferRepository.new.save(@job_offer)
      flash[:success] = 'Offer activated'
    else
      flash.now[:error] = 'Operation failed'
    end

    redirect '/job_offers/my'
  end

  delete :destroy do
    @job_offer = JobOfferRepository.new.find(params[:offer_id])
    if JobOfferRepository.new.destroy(@job_offer)
      flash[:success] = 'Offer deleted'
    else
      flash.now[:error] = 'Title is mandatory'
    end
    redirect 'job_offers/my'
  end
end
