FactoryBot.define do
  factory :user do
    email        { Faker::Internet.email }
    name         { Faker::Name.name }
    password     { Faker::Internet.password }
    confirmed_at { Time.zone.today }

    trait :with_top_comments do
      after(:create) do |user|
        create(:top_comment, user: user)
      end
    end

    trait :with_comments do
      after(:create) do |user|
        movies = create_list(:movie, 5)
        movies.each do |movie|
          create(:comment, movie: movie, user: user)
        end
      end
    end
  end
end
