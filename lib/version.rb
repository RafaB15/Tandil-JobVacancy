class Version
  MAYOR = 1
  MINOR = 0
  PATCH = 17

  def self.current
    "#{MAYOR}.#{MINOR}.#{PATCH}"
  end
end
