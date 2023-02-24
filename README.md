Tea Subscription Service is a Rails API where customers are able to subscribe, update, and cancel their tea subscription services.
# Ruby version

Ruby 2.7.4

Rails 5.2.6

### Set Up
- `clone repository`
- `bundle install`
- `rails db:{create,migrate,seed}`
- `rails s`

* System dependencies [Find out what gems do here](https://rubygems.org)
```
ruby '2.7.4'

gem 'rails', '~> 5.2.7'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12's
gem 'jsonapi-serializer'
gem 'fast_jsonapi'
gem 'bootsnap'


group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'faker'
  gem 'simplecov'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'orderly'
```
# Post Gem installation 
- `Bundle install`
- `Bundle update`

# Endpoints Created

Create a Subscription for a Particular Customer
- `POST  /api/v1/customers/:customer_id/subscriptions


![Screenshot 2023-02-23 at 7 55 00 PM](https://user-images.githubusercontent.com/89422302/221088204-9033ce32-8059-4092-b7b0-1320e7176392.png)

Get Subscriptions for a Particular Customer
- `GET  /api/v1/customers/:customer_id/subscriptions`

![Screenshot 2023-02-23 at 7 57 24 PM](https://user-images.githubusercontent.com/89422302/221088420-60323898-5341-413e-838d-887ee904c753.png)

Update a Particular Customers Subscription
- `PATCH  /api/v1/customers/:customer_id/subscriptions`

![Screenshot 2023-02-23 at 8 15 16 PM](https://user-images.githubusercontent.com/89422302/221090469-b9b31943-6835-4305-95fd-c8389fcf3950.png)

