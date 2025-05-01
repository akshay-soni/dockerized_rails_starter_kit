FROM ruby:3.2.3-alpine

RUN apk add --update --no-cache \
  build-base \
  git \
  postgresql-dev \
  nodejs \
  yarn \
  tzdata \
  redis

WORKDIR /app

# Install Rails gem before copying the full app
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local without 'development test' && \
    bundle config set --local frozen false && \
    bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]