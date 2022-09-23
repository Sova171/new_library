# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123456' }
  end

  factory :book do
    title { Faker::JapaneseMedia::OnePiece.location }
    description { Faker::TvShows::FamilyGuy.quote }
  end

  factory :rating do
    title { Faker::JapaneseMedia::OnePiece.location }

    trait :pretty do
      title { 'Pretty' }
    end

    trait :bad do
      title { 'Bad' }
    end

    factory :pretty_rating, traits: [:pretty]
    factory :bad_rating, traits: [:bad]
  end

  factory :rating_book do
    user
    book
    rating
  end

  factory :list do
    name { Faker::TvShows::Friends.quote }
    user
  end

  factory :author do
    full_name { Faker::TvShows::Friends.character }
  end
end
