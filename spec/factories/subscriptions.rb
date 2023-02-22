FactoryBot.define do
  factory :subscription do
    customer { nil }
    tea { nil }
    title { "MyString" }
    price { "9.99" }
    status { "MyString" }
    frequency { 1 }
  end
end
