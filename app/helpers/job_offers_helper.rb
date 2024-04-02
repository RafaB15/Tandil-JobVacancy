# Helper methods defined here can be accessed in any controller or view in the application
NOT_SPECIFIED_REQUIRED_EXPERIENCE_FROM_STRING = nil
NOT_SPECIFIED_REQUIRED_EXPERIENCE = ''.freeze

JobVacancy::App.helpers do
  def job_offer_params
    params[:job_offer_form].to_h.symbolize_keys

    if params[:job_offer_form][:required_experience] == NOT_SPECIFIED_REQUIRED_EXPERIENCE
      params[:job_offer_form][:required_experience] =
        NOT_SPECIFIED_REQUIRED_EXPERIENCE_FROM_STRING
    end

    params[:job_offer_form]
  end
end
