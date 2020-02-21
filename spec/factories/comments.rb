FactoryBot.define do
  factory :comment do
    user
    movie
    text { Faker::Lorem.word }
  end
end
