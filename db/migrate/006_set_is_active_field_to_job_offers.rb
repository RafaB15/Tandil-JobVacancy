migration 6, :set_is_active_field_to_job_offers do
  up do
    offers = JobOffer.all
    offers.each do | offer |
      offer.is_active = true
      offer.save
    end
  end

  down do
  end
end
