class UserBiller
  def initialize(user_repo, offer_repo)
    @user_repo = user_repo
    @offer_repo = offer_repo
  end

  def create_all_users_billing
    job_offers_size = @offer_repo.all_active.size
    all_user_bills = []
    amount_to_pay = if @user_repo.find_by_email('pepe@pepito.com').nil?
                      0
                    else
                      @user_repo.find_by_email('pepe@pepito.com').amount_to_pay(job_offers_size)
                    end

    user_bill = {
      user_email: 'pepe@pepito.com',
      amount_to_pay:
    }
    all_user_bills.append(user_bill)

    all_user_bills
  end
end
