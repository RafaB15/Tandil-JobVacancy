JobVacancy::App.helpers do
  attr_writer :current_user

  def current_user
    @current_user ||= User.with_pk(session[:current_user])
  end

  def sign_in(user)
    session[:current_user] = user.id
    self.current_user = user
  end

  def sign_out
    session.delete(:current_user)
  end

  def signed_in?
    !current_user.nil?
  end
end
