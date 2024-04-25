class UserBiller
  def initialize(user_repo, offer_repo)
    @user_repo = user_repo
    @offer_repo = offer_repo
  end

  def create_all_users_billing
    all_users = @user_repo.all
    all_user_bills = []

    all_users.each do |user|
      active_offers_count = @offer_repo.find_actives_by_owner(user).size

      amount_to_pay =
        user.amount_to_pay(active_offers_count).to_f

      subscription = SubscriptionFactory.create_from_object(user.subscription)

      user_bill = {
        user_email: user.email,
        subscription:,
        active_offers_count:,
        amount_to_pay:
      }
      all_user_bills.append(user_bill)
    end

    all_user_bills
  end
end
