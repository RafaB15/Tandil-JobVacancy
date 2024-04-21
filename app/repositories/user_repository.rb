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
    user.create_subscription_type_for_self
    user
  end

  def changeset(user)
    {
      name: user.name,
      crypted_password: user.crypted_password,
      email: user.email,
      subscription_type: user.subscription_type.type
    }
  end
end
