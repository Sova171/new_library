# frozen_string_literal: true

RatingBook.destroy_all

Book.all.each do |book|
  User.all.each do |user|
    rating = rand(Rating.first.id..Rating.last.id)
    RatingBook.create(book_id: book.id, user_id: user.id, rating_id: rating)
    rate_count = RatingCount.find_by(book_id: book.id, rating_id: rating)
    rate_count.update_attribute(:count, rate_count.count += 1)
  end
end
