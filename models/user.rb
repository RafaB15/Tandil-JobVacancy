class User < Sequel::Model
  one_to_many :job_offers

  def validate
    super
    validates_presence [ :name, :email, :crypted_password ]
    validates_format /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, :email
  end

  def password= (password)
    self.crypted_password = ::BCrypt::Password.create(password) unless password.nil?
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.has_password?(password)? user : nil
  end

  def has_password?(password)
    ::BCrypt::Password.new(crypted_password) == password
  end

end
