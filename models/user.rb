class User
  include ActiveModel::Validations

  attr_accessor :id, :name, :email, :crypted_password, :updated_on, :created_on, :subscription

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name, :crypted_password, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: 'invalid email' }
  validates_length_of :crypted_password, minimum: 8, message: 'Password too short, minimum length is 8 characters'
  validates_format_of :crypted_password, with: /\d/, message: 'Password must contain at least one number'
  validates_format_of :crypted_password, with: /[A-Z]/, message: 'Missing uppercase letters'
  validates_format_of :crypted_password, with: /[$_&]/, message: 'Special character missing : $ , _ , &'

  def self.create(name, email, password, subscription)
    data = {}
    data[:name] = name
    data[:email] = email
    data[:password] = password
    data[:subscription] = subscription
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
    @subscription = data[:subscription] ||= SubscriptionFactory.default
  end

  def has_password?(password)
    Crypto.decrypt(crypted_password) == password
  end

  def amount_to_pay(number_of_active_offers)
    @subscription.compute_amount_to_pay_for_total_active_offers(number_of_active_offers)
  end
end

class ErrorSavingUser < StandardError
  ERROR_MSG = 'Error saving user in repository'.freeze
  def initialize(error_message = ERROR_MSG)
    super(error_message)
  end
end
