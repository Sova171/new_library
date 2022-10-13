# frozen_string_literal: true

Book.delete_all

def create_book
  book = Book.create(
    title:        Faker::JapaneseMedia::OnePiece.location,
    publisher:    Faker::Sports::Basketball.team,
    description:  Faker::TvShows::FamilyGuy.quote,
    pages_count:  rand(10..320),
    published_at: Faker::TvShows::Friends.quote
  )
  book.save!
end

12.times { create_book }
