# 19.01.20現在最新安定版
FROM ruby:2.5.3

# railsコンソール中で日本語入力するための設定 <- NEW
ENV LANG C.UTF-8

# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# /var/lib/apt/lists配下のキャッシュを削除し容量を小さくする <- NEW
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリの設定
RUN mkdir /app_name
ENV APP_ROOT /app_name
WORKDIR $APP_ROOT

# gemfileを追加する
ADD ./src/Gemfile $APP_ROOT/Gemfile
ADD ./src/Gemfile.lock $APP_ROOT/Gemfile.lock

# gemfileのinstall
RUN bundle install
ADD ./src/ $APP_ROOT
