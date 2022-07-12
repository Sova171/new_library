# frozen_string_literal: true

Author.delete_all

def create_authors
  author = Author.create(
    full_name: Faker::TvShows::Friends.character,
    birthdate: Date.today - rand(2000),
    biography: Faker::JapaneseMedia::OnePiece.quote
  )
  author.save!
end

6.times { create_authors }
