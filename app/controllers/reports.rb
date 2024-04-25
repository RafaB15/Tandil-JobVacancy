JobVacancy::App.controllers :reports, provides: [:json] do
  get :billing do
    user_repo = UserRepository.new
    job_offer_repo = JobOfferRepository.new

    offer_counter = OfferCounter.new(job_offer_repo)

    items = UserBiller.new(user_repo, job_offer_repo).create_all_users_billing

    total_amount = items.sum { |item| item[:amount_to_pay] }

    report = {
      items:,
      total_amount:,
      total_active_offers: offer_counter.count_active
    }
    return report.to_json
  end
end
