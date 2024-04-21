JobVacancy::App.controllers :reports, provides: [:json] do
  get :billing do
    user_repo = UserRepository.new
    job_offer_repo = JobOfferRepository.new
    offer_counter = OfferCounter.new(job_offer_repo)
    amount_adder = AmountAdder.new(job_offer_repo)
    items = UserBiller.new(user_repo, job_offer_repo).create_all_users_billing
    report = {
      items:,
      total_amount: amount_adder.add_amount.to_f,
      total_active_offers: offer_counter.count_active
    }
    return report.to_json
  end
end
