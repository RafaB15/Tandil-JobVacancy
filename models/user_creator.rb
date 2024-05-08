class UserCreator
  def initialize(name, email, subscription, password, age)
    @name = name
    @email = email
    @subscription = subscription
    @password = password
    @age = age
  end

  def create_user
    PasswordValidator.new(@password).describe_state # Si hago el validate abajo, tiene sentido este objeto ?
    User.verify_age(@age)
    user = User.create(@name, @email, @password, @subscription)
    user.validate!
    raise ErrorSavingUser if UserRepository.new.save(user) == false

    user
  end
end
