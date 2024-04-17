JobVacancy::App.controllers :reports, provides: [:json] do
  get :billing do
    repo = JobOfferRepository.new
    offer_counter = OfferCounter.new(repo)
    amount_adder = AmountAdder.new(repo)
    report = {
      total_amount: amount_adder.add_amount.to_f,
      total_active_offers: offer_counter.count_active
    }
    return report.to_json
  end
end
