FROM ruby:2.5.7
RUN mkdir /temp
WORKDIR /temp
ADD . /temp
RUN gem install bundler -v 1.16.1
RUN bundler install
RUN mkdir /jobvacancy
WORKDIR /jobvacancy
EXPOSE 3000

