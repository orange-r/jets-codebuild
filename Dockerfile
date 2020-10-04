FROM ruby:2.5.3

ENV APP_PATH=/usr/src/app
ENV LANG=ja_JP.UTF-8
WORKDIR $APP_PATH

RUN apt-get update -qq && \
    apt-get install -y \
    nodejs \
    zip \
    unzip \
    rsync

COPY Gemfile $APP_PATH/
COPY Gemfile.lock APP_PATH/

RUN bundle install --system
COPY . $APP_PATH

# Install yarn
# RUN curl -o- -L https://yarnpkg.com/install.sh | bash
# ENV PATH="/root/.yarn/bin:$PATH"

# CMD ["jets", "server", "--port", "3000", "--host", "0.0.0.0"]

