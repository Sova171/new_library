FactoryBot.define do
  factory :user do
    email { 'vladkutsak@gmail.com' }
    password { '123456' }
  end

  factory :book do
    title { Faker::JapaneseMedia::OnePiece.location }
    description { Faker::TvShows::FamilyGuy.quote }
  end

  factory :rating do
    title { Faker::JapaneseMedia::OnePiece.location }
  end

  factory :list do
    name { Faker::TvShows::Friends.quote }
    user
  end

  factory :author do
    full_name { Faker::TvShows::Friends.character }
  end
end
