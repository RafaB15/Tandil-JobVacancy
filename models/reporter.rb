class Reporter
  def initialize(offer_counter, user_biller)
    @offer_counter = offer_counter
    @user_biller = user_biller
  end

  def report
    total_active_offers = @offer_counter.count_active
    items = @user_biller.create_all_users_billing
    total_amount = items.sum { |item| item[:amount_to_pay] }

    {
      items:,
      total_amount:,
      total_active_offers:
    }
  end
end
