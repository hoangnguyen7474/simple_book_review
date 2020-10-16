FROM ruby:2.7.1

ENV APP_DIR=/var/www/html

RUN apt-get update && apt-get install -y build-essential libpq-dev

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
 && apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update && apt-get install yarn

RUN mkdir -p ${APP_DIR} \
 && mkdir -p ${APP_DIR}/log ${APP_DIR}/tmp/pids

WORKDIR ${APP_DIR}

COPY Gemfile      Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler && bundle install

COPY package.json package.json
COPY yarn.lock    yarn.lock

RUN yarn install

COPY . .

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3000 