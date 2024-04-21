require_relative 'subscription_corporate'
require_relative 'subscription_on_demand'

class User
  include ActiveModel::Validations

  attr_accessor :id, :name, :email, :crypted_password, :updated_on, :created_on, :subscription_type

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name, :crypted_password, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX,
                                              message: 'invalid email' }

  def self.create(name, email, password, subscription_type)
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
    @subscription_type = data[:subscription_type].nil? ? SubscriptionOnDemand.new : data[:subscription_type]
  end

  def create_subscription_type_for_self
    @subscription_type = case @subscription_type
                         when 'on-demand'
                           SubscriptionOnDemand.new
                         when 'corporate'
                           SubscriptionCorporate.new
                         end
  end

  def has_password?(password)
    Crypto.decrypt(crypted_password) == password
  end

  def amount_to_pay(number_of_active_offers)
    if @subscription_type.is_a?(SubscriptionOnDemand)
      amount_to_pay = subscription_type.compute_amount_to_pay_for_total_active_offers(number_of_active_offers)
    end
    amount_to_pay = 80 if @subscription_type.is_a?(SubscriptionCorporate)
    amount_to_pay
  end
end
