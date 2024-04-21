class UserBiller
  def initialize(user_repo, offer_repo)
    @user_repo = user_repo
    @offer_repo = offer_repo
  end

  def create_all_users_billing
    job_offers_size = @offer_repo.all_active.size
    all_user_bills = []

    user_bill = {
      user_email: 'pepe@pepito.com',
      amount_to_pay: SubscriptionOnDemand.new
                                         .compute_amount_to_pay_for_total_active_offers(job_offers_size)
    }
    all_user_bills.append(user_bill)

    all_user_bills
  end
end
