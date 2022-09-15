JobVacancy::App.controllers :reports, provides: [:json] do
  get :billing do
    report = {
      total_offers: 10
    }
    return report.to_json
  end
end
