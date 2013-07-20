JobVacancy::App.controllers :sessions do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  get :login, :map => '/login' do
    @user = User.new
    render 'sessions/new'
  end

  post :create do
    email = params[:user][:email]
    password = params[:user][:password]
    @user = User.authenticate(email, password)
    if (@user.nil?)
      @user = User.new
      flash.now[:error] = 'Invalid credentials'
      render 'sessions/new'
    else
      sign_in @user
      redirect '/'          
    end
  end

  get :destroy, :map => '/logout' do 
    sign_out
    redirect '/'          
  end

end
