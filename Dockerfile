FROM ruby:2.7.5
RUN mkdir /temp
WORKDIR /temp
ADD . /temp
RUN gem install bundler -v 2.1.4
RUN bundler install
RUN mkdir /jobvacancy
WORKDIR /jobvacancy
EXPOSE 3000