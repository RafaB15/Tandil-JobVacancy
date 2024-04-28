class PasswordValidator
  PASSWORD_TOO_SHORT_MESSAGE = 'Password too short, minimum length is 8 characters'.freeze
  PASSWORD_MUST_CONTAIN_NUMBER_MESSAGE = 'Password must contain at least one number'.freeze
  MISSING_UPPERCASE_LETTERS_MESSAGE = 'Missing uppercase letters'.freeze
  USER_CREATED_MESSAGE = 'User created'.freeze

  MIN_CHARACTERS = 8
  HAS_DIGIT_REGEX = /\d/
  HAS_UPPERCASE_REGEX = /[A-Z]/

  def initialize(password)
    @password = password
  end

  def describe_state
    return PASSWORD_TOO_SHORT_MESSAGE if @password.length < MIN_CHARACTERS
    return PASSWORD_MUST_CONTAIN_NUMBER_MESSAGE if @password.scan(HAS_DIGIT_REGEX).empty?
    return MISSING_UPPERCASE_LETTERS_MESSAGE if @password.scan(HAS_UPPERCASE_REGEX).empty?

    USER_CREATED_MESSAGE
  end
end
