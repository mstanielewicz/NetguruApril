FactoryGirl.define do
  factory :product do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    price 13.99
    user
    category
  end
end
