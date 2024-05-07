class InvalidPasswordError < StandardError
end

class PasswordValidator
  PASSWORD_TOO_SHORT_MESSAGE = 'Password too short, minimum length is 8 characters'.freeze
  PASSWORD_MUST_CONTAIN_NUMBER_MESSAGE = 'Password must contain at least one number'.freeze
  MISSING_UPPERCASE_LETTERS_MESSAGE = 'Missing uppercase letters'.freeze
  SPECIAL_CHARACTER_MESSAGE = 'Special character missing : $ , _ , &'.freeze

  MIN_CHARACTERS = 8
  HAS_DIGIT_REGEX = /\d/
  HAS_UPPERCASE_REGEX = /[A-Z]/
  HAS_SPECIAL_CHARACTER = /[$_&]/

  def initialize(password)
    @password = password
  end

  def describe_state
    raise InvalidPasswordError, PASSWORD_TOO_SHORT_MESSAGE if @password.length < MIN_CHARACTERS
    raise InvalidPasswordError, PASSWORD_MUST_CONTAIN_NUMBER_MESSAGE if @password.scan(HAS_DIGIT_REGEX).empty?
    raise InvalidPasswordError, MISSING_UPPERCASE_LETTERS_MESSAGE if @password.scan(HAS_UPPERCASE_REGEX).empty?
    raise InvalidPasswordError, SPECIAL_CHARACTER_MESSAGE if @password.scan(HAS_SPECIAL_CHARACTER).empty?
  end
end
