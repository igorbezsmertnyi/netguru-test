FactoryBot.define do
  factory :top_comment do
    user
    count { Faker::Number.within(range: 1..10) }
  end
end
