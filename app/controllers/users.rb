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
        flash.now[:error] = 'All fields are mandatory'
        render 'users/new'
      elsif params[:user][:password].length < 8
        flash.now[:error] = 'Password too short, minimum length is 8 characters'
        render 'users/new'
      elsif params[:user][:password].scan(/\d/).empty?
        flash.now[:error] = 'Password must contain at least one number'
        render 'users/new'
      elsif UserRepository.new.save(@user)
        flash[:success] = 'User created'
        redirect '/'
      else
        flash.now[:error] = 'Error creating user'
        render 'users/new'
      end
    else
      flash.now[:error] = 'Passwords do not match'
      render 'users/new'
    end
  end
end
