class SubscriptionOnDemand
  AMOUNT_PER_OFFER = 10.0
  def compute_amount_to_pay_for_total_active_offers(total_active_offers)
    AMOUNT_PER_OFFER * total_active_offers
  end
end
