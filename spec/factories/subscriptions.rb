FactoryBot.define do
  factory :subscription do
    customer
    tea
    title { Faker::Subscription.plan }
    price { Faker::Commerce.price(range: 0..10.0)}
    status { Faker::Subscription.status }
    frequency { "Daily" }
  end
end
