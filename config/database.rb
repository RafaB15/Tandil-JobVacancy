Sequel::Model.raise_on_save_failure = false # Do not throw exceptions on failure

Sequel::Model.db = case Padrino.env
  when :development then Sequel.connect("postgres://jobvacancy:jobvacancy@localhost/jobvacancy_development", :loggers => [logger])
  when :test        then Sequel.connect("postgres://jobvacancy:jobvacancy@localhost/jobvacancy_test", :loggers => [logger])
  when :staging     then Sequel.connect(ENV['DATABASE_URL'], loggers: [logger])
  when :production  then Sequel.connect(ENV['DATABASE_URL'], loggers: [logger])
end
