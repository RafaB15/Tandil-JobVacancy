class UserCreator
  def initialize(name, email, subscription_type, password)
    @name = name
    @email = email
    @subscription = SubscriptionFactory.create_from_string(subscription_type)
    @password = password
  end

  def create_user
    @user = User.create(@name, @email, @password, @subscription)
    @user
  end

  def validate_and_save_user
    PasswordValidator.new(@password) # Si hago el validate abajo, tiene sentido este objeto ?
    @user.validate!
    raise ErrorSavingUser if UserRepository.new.save(@user) == false
  end
end
