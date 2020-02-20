FactoryBot.define do
  factory :genre do
    name { Faker::Lorem.word }

    trait :with_movies do
      after(:create) do |genre|
        %w[Kill\ Bill Godfather Django Star\ Wars\ V The\ Dark\ Knight].each do |movie|
          create(:movie, title: movie, genre: genre)
        end
      end
    end
  end
end
