JobVacancy::App.controllers :reports, provides: [:json] do
  get :billing do
    repo = JobOfferRepository.new
    offer_counter = OfferCounter.new(repo)
    report = {
      month: '2022-09',
      total_active_offers: offer_counter.count_active
    }
    return report.to_json
  end
end
