FROM ruby:3.1.2
ARG GIT_COMMIT=undefined
LABEL GIT_COMMIT=$GIT_COMMIT
LABEL AUTHOR=NicoPaez
RUN mkdir /jobvacancy
WORKDIR /jobvacancy
COPY . /jobvacancy
RUN gem install bundler -v 2.2.6
RUN bundler install
RUN useradd -m jobvacancy
RUN chown -R jobvacancy:jobvacancy /jobvacancy
USER jobvacancy
CMD ["/jobvacancy/start_app.sh"]
