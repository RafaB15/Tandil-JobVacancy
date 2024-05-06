MANDATORY_FIELDS_MESSAGE = 'All fields are mandatory'.freeze
PASSWORDS_DONT_MATCH_MESSAGE = 'Passwords do not match'.freeze
BLANK_INPUT = ''.freeze

JobVacancy::App.controllers :users do
  get :new, map: '/register' do
    @user = User.new
    render 'users/new'
  end

  post :create do
    name = params[:user][:name]
    email = params[:user][:email]
    subscription_type = params[:user][:subscription_type]
    password = params[:user][:password]
    password_confirmation = params[:user][:password_confirmation]

    # Si no se guarda un objeto user (valido o no) rompe el users/new
    user_creator = UserCreator.new(name, email, subscription_type, password)
    @user = user_creator.create_user

    if password != password_confirmation
      flash.now[:error] = PASSWORDS_DONT_MATCH_MESSAGE
      render 'users/new'
      return
    end

    if name == BLANK_INPUT || email == BLANK_INPUT || password == BLANK_INPUT
      flash.now[:error] = MANDATORY_FIELDS_MESSAGE
      render 'users/new'
      return
    end

    begin
      user_creator.validate_and_save_user
      flash[:success] = 'User created'
      redirect '/'
    rescue ActiveModel::ValidationError => e
      flash.now[:error] = e.message
      render 'users/new'
    end
  end
end
