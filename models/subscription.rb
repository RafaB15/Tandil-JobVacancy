class SubscriptionFactory
  ON_DEMAND_TYPE = 'on-demand'.freeze
  CORPORATE_TYPE = 'corporate'.freeze

  def self.create_from_string(subscription_type_string)
    case subscription_type_string
    when ON_DEMAND_TYPE
      SubscriptionOnDemand.new
    when CORPORATE_TYPE
      SubscriptionCorporate.new
    else
      SubscriptionOnDemand.new
    end
  end

  def self.create_from_object(subscription_type_object)
    return ON_DEMAND_TYPE if subscription_type_object.is_a?(SubscriptionOnDemand)

    CORPORATE_TYPE if subscription_type_object.is_a?(SubscriptionCorporate)
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
end

class SubscriptionCorporate
  FIXED_AMOUNT = 80

  def compute_amount_to_pay_for_total_active_offers(_total_active_offers)
    FIXED_AMOUNT
  end
end

class SubscriptionProfessional
end
