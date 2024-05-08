MANDATORY_FIELDS_MESSAGE = 'All fields are mandatory'.freeze
PASSWORDS_DONT_MATCH_MESSAGE = 'Passwords do not match'.freeze
BLANK_INPUT = ''.freeze

JobVacancy::App.controllers :users do
  get :new, map: '/register' do
    @user = User.new
    render 'users/new'
  end

  post :create do
    @user = User.new(params[:user])
    begin
      subscription = SubscriptionFactory.create_from_string(params[:user][:subscription_type])
      user_creator = UserCreator.new(params[:user][:name], params[:user][:email], subscription,
                                     params[:user][:password], params[:user][:age])
      if params[:user][:password] != params[:user][:password_confirmation]
        flash.now[:error] = PASSWORDS_DONT_MATCH_MESSAGE
        render 'users/new'
      elsif params[:user][:name] == BLANK_INPUT ||
            params[:user][:email] == BLANK_INPUT || params[:user][:password] == BLANK_INPUT
        flash.now[:error] = MANDATORY_FIELDS_MESSAGE
        render 'users/new'
      else
        user_creator.validate_and_save_user
        flash[:success] = 'User created'
        redirect '/'
      end
    rescue InvalidSubscriptionTypeError
      flash.now[:error] = 'Invalid subscription type'
      render 'users/new'
    rescue InvalidPasswordError, InvalidAgeError, ActiveModel::ValidationError => e
      flash.now[:error] = e.message
      render 'users/new'
    end
  end
end
