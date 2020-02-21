FactoryBot.define do
  factory :movie do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence(word_count: 3, supplemental: true) }
    released_at { Faker::Date.between(from: 40.years.ago, to: Time.zone.today) }
    genre
  end
end
