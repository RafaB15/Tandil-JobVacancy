class User
  include ActiveModel::Validations

  attr_accessor :id, :name, :email, :crypted_password, :updated_on, :created_on, :subscription_type

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name, :crypted_password, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX,
                                              message: 'invalid email' }

  def self.create(name, email, password,subscription_type)
    data = {}
    data[:name] = name
    data[:email] = email
    data[:password] = password
    data[:subscription_type] = subscription_type
    User.new(data)
  end

  def initialize(data = {})
    @id = data[:id]
    @name = data[:name]
    @email = data[:email]
    @crypted_password = if data[:password].nil?
                          data[:crypted_password]
                        else
                          Crypto.encrypt(data[:password])
                        end
    @updated_on = data[:updated_on]
    @created_on = data[:created_on]
    @subscription_type = data[:subscription_type]
  end

  def has_password?(password)
    Crypto.decrypt(crypted_password) == password
  end
end
