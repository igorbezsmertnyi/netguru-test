FactoryBot.define do
  factory :user do
    email        { Faker::Internet.email }
    name         { Faker::Name.name }
    password     { Faker::Internet.password }
    confirmed_at { Date.today }
  end
end
