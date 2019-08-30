FROM ruby:2.6.3

WORKDIR /app

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    postgresql-client \
    nodejs \
    yarn \
  && rm -rf /var/lib/apt/lists

COPY Gemfile* ./
RUN bundle install --without production

COPY package.json ./
COPY yarn.lock ./

RUN yarn install
EXPOSE 5000
CMD bundle exec rails s -p 5000 -b 0.0.0.0
