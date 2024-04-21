class UserBiller
  def initialize(user_repo, offer_repo)
    @user_repo = user_repo
    @offer_repo = offer_repo
  end

  def create_all_users_billing
    job_offers_size = @offer_repo.all_active.size

    all_user_bills = []

    if job_offers_size.zero?
      user_bill = {
        user_email: 'john@doe.com',
        amount_to_pay: 0.0
      }

      all_user_bills.append(user_bill)
    end

    all_user_bills
  end
end
