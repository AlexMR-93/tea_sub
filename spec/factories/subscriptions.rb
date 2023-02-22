FactoryBot.define do
  factory :subscription do
    customer
    tea
    title { Faker::Subscription.plan }
    price { Faker::Commerce.price(range: 0..10.0, as_string: true)}
    status { Faker::Subscription.status }
    frequency { 1 }
  end
end
