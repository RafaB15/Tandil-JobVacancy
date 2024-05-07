class UserCreator
  def initialize(name, email, subscription, password)
    @name = name
    @email = email
    @subscription = subscription
    @password = password
  end

  def validate_and_save_user
    PasswordValidator.new(@password).describe_state # Si hago el validate abajo, tiene sentido este objeto ?
    user = User.create(@name, @email, @password, @subscription)
    user.validate!
    raise ErrorSavingUser if UserRepository.new.save(user) == false

    user
  end
end
