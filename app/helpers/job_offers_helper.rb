# Helper methods defined here can be accessed in any controller or view in the application

JobVacancy::App.helpers do
  def job_offer_params
    params[:job_offer_form].to_h.symbolize_keys

    params[:job_offer_form][:required_experience] = nil if params[:job_offer_form][:required_experience] == ''

    params[:job_offer_form]
  end
end
