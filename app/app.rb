module JobVacancy
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions

    set :delivery_method, file: {
      location: "#{Padrino.root}/tmp/emails"
    }
  end
end
