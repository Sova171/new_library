# frozen_string_literal: true

Author.delete_all

def create_authors
  author = Author.create(
    full_name:     Faker::TvShows::Friends.character,
    biography:     Faker::JapaneseMedia::OnePiece.quote,
    date_of_birth: Date.today - rand(2000)
  )
  author.save!
end

6.times { create_authors }
