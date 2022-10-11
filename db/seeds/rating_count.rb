# frozen_string_literal: true

RatingCount.destroy_all

Book.all.each do |book|
  Rating.all.each do |rating|
    RatingCount.new(book_id: book.id, rating_id: rating.id).save!
  end
end
