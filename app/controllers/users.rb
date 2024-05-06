MANDATORY_FIELDS_MESSAGE = 'All fields are mandatory'.freeze
PASSWORDS_DONT_MATCH_MESSAGE = 'Passwords do not match'.freeze
BLANK_INPUT = ''.freeze

JobVacancy::App.controllers :users do
  get :new, map: '/register' do
    @user = User.new
    render 'users/new'
  end

  post :create do
    password_confirmation = params[:user][:password_confirmation]
    params[:user].reject! { |k, _| k == 'password_confirmation' }

    subscription = SubscriptionFactory.create_from_string(params[:user][:subscription_type])
    @user = User.create(params[:user][:name], params[:user][:email], params[:user][:password], subscription)

    if params[:user][:password] == password_confirmation
      if params[:user][:password] == BLANK_INPUT || params[:user][:name] == BLANK_INPUT ||
         params[:user][:email] == BLANK_INPUT
        flash.now[:error] = MANDATORY_FIELDS_MESSAGE
        render 'users/new'
      else
        validator = PasswordValidator.new(params[:user][:password])
        string_state = validator.describe_state
        if string_state == PasswordValidator::USER_CREATED_MESSAGE && UserRepository.new.save(@user)
          flash[:success] = string_state
          redirect '/'
        else
          flash.now[:error] = string_state
          render 'users/new'
        end
      end
    else
      flash.now[:error] = PASSWORDS_DONT_MATCH_MESSAGE
      render 'users/new'
    end
  end
end
