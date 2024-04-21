class SubscriptionOnDemand
  ON_DEMAND_TYPE = 'on-demand'.freeze
  AMOUNT_PER_OFFER = 10.0
  def compute_amount_to_pay_for_total_active_offers(total_active_offers)
    AMOUNT_PER_OFFER * total_active_offers
  end

  def type
    ON_DEMAND_TYPE
  end
end
