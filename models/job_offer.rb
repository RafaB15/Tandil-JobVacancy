class JobOffer
  include ActiveModel::Validations

  attr_accessor :id, :user, :user_id, :title,
                :location, :description, :required_experience, :is_active,
                :updated_on, :created_on

  REQUIRED_EXPERIENCE_ERROR_MESSAGE = 'is not a natural number or empty'.freeze
  MINIMUM_YEARS_OF_EXPERIENCE = 0

  validates :title, presence: true
  validates :required_experience,
            numericality: { only_integer: true, greater_than_or_equal_to: MINIMUM_YEARS_OF_EXPERIENCE, allow_nil: true,
                            message: REQUIRED_EXPERIENCE_ERROR_MESSAGE }

  def initialize(data = {})
    @id = data[:id]
    @title = data[:title]
    @location = data[:location]
    @description = data[:description]
    @required_experience = data[:required_experience]
    @is_active = data[:is_active]
    @updated_on = data[:updated_on]
    @created_on = data[:created_on]
    @user_id = data[:user_id]
    validate!
  end

  def owner
    user
  end

  def owner=(a_user)
    self.user = a_user
  end

  def activate
    self.is_active = true
  end

  def deactivate
    self.is_active = false
  end

  def old_offer?
    (Date.today - updated_on) >= 30
  end

  def is_required_experience_not_specified?
    @required_experience.nil? || @required_experience.zero?
  end
end
