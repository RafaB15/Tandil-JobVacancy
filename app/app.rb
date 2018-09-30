module JobVacancy
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Sprockets
    sprockets minify: (Padrino.env == :production)

    enable :sessions

    set :delivery_method, file: {
      location: "#{Padrino.root}/tmp/emails"
    }
  end
end
