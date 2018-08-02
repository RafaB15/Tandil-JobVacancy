Sequel::Model.raise_on_save_failure = false # Do not throw exceptions on failure

Sequel::Model.db = case Padrino.env
  when :development then Sequel.connect("sqlite://db/job_vacancy_sqlite_development.db", :loggers => [logger])
  when :test        then Sequel.connect("sqlite::memory:", loggers: [logger])
  when :staging     then Sequel.connect(ENV['DATABASE_URL'], loggers: [logger])
  when :production  then Sequel.connect(ENV['DATABASE_URL'], loggers: [logger])
end
