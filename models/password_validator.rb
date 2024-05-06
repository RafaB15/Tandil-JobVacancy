class PasswordValidator
  include ActiveModel::Validations

  attr_reader :password

  PASSWORD_TOO_SHORT_MESSAGE = 'Password too short, minimum length is 8 characters'.freeze
  PASSWORD_MUST_CONTAIN_NUMBER_MESSAGE = 'Password must contain at least one number'.freeze
  MISSING_UPPERCASE_LETTERS_MESSAGE = 'Missing uppercase letters'.freeze
  SPECIAL_CHARACTER_MISSISNG_MESSAGE = 'Special character missing : $ , _ , &'.freeze

  MIN_CHARACTERS = 8
  HAS_DIGIT_REGEX = /\d/
  HAS_UPPERCASE_REGEX = /[A-Z]/
  HAS_SPECIAL_CHARACTER = /[$_&]/

  validates_length_of :password, minimum: MIN_CHARACTERS, message: PASSWORD_TOO_SHORT_MESSAGE
  validates_format_of :password, with: HAS_DIGIT_REGEX, message: PASSWORD_MUST_CONTAIN_NUMBER_MESSAGE
  validates_format_of :password, with: HAS_UPPERCASE_REGEX, message: MISSING_UPPERCASE_LETTERS_MESSAGE
  validates_format_of :password, with: HAS_SPECIAL_CHARACTER, message: SPECIAL_CHARACTER_MISSISNG_MESSAGE

  def initialize(password)
    @password = password
    validate!
  end
end
