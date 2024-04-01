class JobOfferForm
  attr_accessor :id, :title, :location, :description, :required_experience

  def self.from(a_job_offer)
    form = JobOfferForm.new
    form.id = a_job_offer.id
    form.title = a_job_offer.title
    form.location = a_job_offer.location
    form.description = a_job_offer.description
    form.required_experience = a_job_offer.required_experience
    form
  end
end
