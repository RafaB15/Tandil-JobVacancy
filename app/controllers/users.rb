MANDATORY_FIELDS_MESSAGE = 'All fields are mandatory'.freeze
PASSWORDS_DONT_MATCH_MESSAGE = 'Passwords do not match'.freeze

JobVacancy::App.controllers :users do
  get :new, map: '/register' do
    @user = User.new
    render 'users/new'
  end

  post :create do
    password_confirmation = params[:user][:password_confirmation]
    params[:user].reject! { |k, _| k == 'password_confirmation' }

    @user = User.new(params[:user])

    if params[:user][:password] == password_confirmation
      if params[:user][:password] == '' || params[:user][:name] == '' || params[:user][:email] == ''
        flash.now[:error] = MANDATORY_FIELDS_MESSAGE
        render 'users/new'
      else
        validator = PasswordValidator.new(params[:user][:password])
        string_state = validator.describe_state
        if string_state == PasswordValidator::USER_CREATED_MESSAGE
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
