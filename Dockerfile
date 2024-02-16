FROM ruby:3.0.6-alpine3.16
RUN apk update && apk add --no-cache nodejs yarn libpq-dev build-base bash 
WORKDIR /app
COPY . .
RUN bundle install 
#--without production
RUN yarn install
EXPOSE 3000
CMD bundle exec rails s -p 3000 -b 0.0.0.0
