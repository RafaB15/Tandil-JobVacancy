class UserBiller
  def initialize(user_repo, offer_repo)
    @user_repo = user_repo
    @offer_repo = offer_repo
  end

  def create_all_users_billing
    all_users = @user_repo.all
    all_user_bills = []

    all_users.each do |user|
      user_bill = create_user_billing(user)

      all_user_bills << user_bill
    end

    all_user_bills
  end

  private

  def create_user_billing(user)
    user_email = user.email
    subscription_type = SubscriptionFactory.create_from_object(user.subscription)
    active_offers_count = @offer_repo.find_actives_by_owner(user).size
    amount_to_pay = user.amount_to_pay(active_offers_count).to_f

    {
      user_email:,
      subscription: subscription_type,
      active_offers_count:,
      amount_to_pay:
    }
  end
end
