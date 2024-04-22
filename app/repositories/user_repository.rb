require_relative '../../models/subscription'

class UserRepository < BaseRepository
  self.table_name = :users
  self.model_class = 'User'

  def find_by_email(email)
    row = dataset.first(email:)
    load_object(row) unless row.nil?
  end

  protected

  def load_object(a_record)
    user = super
    subscription_type = a_record[:subscription_type]
    user.subscription = SubscriptionFactory.create_from_string(subscription_type)
    user
  end

  def changeset(user)
    {
      name: user.name,
      crypted_password: user.crypted_password,
      email: user.email,
      subscription_type: SubscriptionFactory.create_from_object(user.subscription)
    }
  end
end
