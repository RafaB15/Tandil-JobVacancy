ON_DEMAND_TYPE = 'on-demand'.freeze
CORPORATE_TYPE = 'corporate'.freeze

class SubscriptionFactory
  def self.create_with(subscription_type)
    case subscription_type
    when ON_DEMAND_TYPE
      SubscriptionOnDemand.new
    when CORPORATE_TYPE
      SubscriptionCorporate.new
    else
      SubscriptionOnDemand.new
    end
  end

  def self.default
    SubscriptionOnDemand.new
  end
end

class SubscriptionOnDemand
  AMOUNT_PER_OFFER = 10
  def compute_amount_to_pay_for_total_active_offers(total_active_offers)
    AMOUNT_PER_OFFER * total_active_offers
  end

  def type
    ON_DEMAND_TYPE
  end
end

class SubscriptionCorporate
  FIXED_AMOUNT = 80

  def compute_amount_to_pay_for_total_active_offers(_total_active_offers)
    FIXED_AMOUNT
  end

  def type
    CORPORATE_TYPE
  end
end
