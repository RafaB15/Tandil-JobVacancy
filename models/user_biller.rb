class UserBiller
  def initialize(user_repo, offer_repo)
    @user_repo = user_repo
    @offer_repo = offer_repo
  end

  def create_all_users_billing
    job_offers_size = @offer_repo.all_active.size
    all_users = @user_repo.all
    all_user_bills = []

    all_users.each do |user|
      amount_to_pay = if user.nil?
                        0
                      else
                        user.amount_to_pay(job_offers_size)
                      end

      user_bill = {
        user_email: user.email,
        amount_to_pay:
      }
      all_user_bills.append(user_bill)
    end
    all_user_bills
  end
end
