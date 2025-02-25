FROM ruby:3.0

WORKDIR /app

COPY . .

CMD ["ruby", "main.rb"]