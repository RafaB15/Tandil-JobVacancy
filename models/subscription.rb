class SubscriptionFactory
  ON_DEMAND_TYPE = 'on-demand'.freeze
  CORPORATE_TYPE = 'corporate'.freeze
  PROFESSIONAL_TYPE = 'professional'.freeze

  def self.create_from_string(subscription_type)
    case subscription_type
    when ON_DEMAND_TYPE
      SubscriptionOnDemand.new
    when CORPORATE_TYPE
      SubscriptionCorporate.new
    when PROFESSIONAL_TYPE
      SubscriptionProfessional.new
    else
      SubscriptionOnDemand.new
    end
  end

  def self.create_from_object(subscription)
    return ON_DEMAND_TYPE if subscription.is_a?(SubscriptionOnDemand)

    return CORPORATE_TYPE if subscription.is_a?(SubscriptionCorporate)

    PROFESSIONAL_TYPE if subscription.is_a?(SubscriptionProfessional)
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
  FIXED_AMOUNT = 30
  MAXIMUM_AMOUNT_OF_INCLUDED_OFFERS = 5
  ADDITIONAL_OFFER_PRICE = 7

  def compute_amount_to_pay_for_total_active_offers(total_active_offers)
    if total_active_offers > MAXIMUM_AMOUNT_OF_INCLUDED_OFFERS
      FIXED_AMOUNT + (total_active_offers - MAXIMUM_AMOUNT_OF_INCLUDED_OFFERS) * ADDITIONAL_OFFER_PRICE
    else
      FIXED_AMOUNT
    end
  end
end
