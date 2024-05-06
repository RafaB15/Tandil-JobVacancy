JobVacancy::App.controllers :reports, provides: [:json] do
  get :billing do
    user_repo = UserRepository.new
    job_offer_repo = JobOfferRepository.new

    offer_counter = OfferCounter.new(job_offer_repo)
    user_biller = UserBiller.new(user_repo, job_offer_repo)

    reporter = Reporter.new(offer_counter, user_biller)

    return reporter.report.to_json
  end
end
