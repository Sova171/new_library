# frozen_string_literal: true

require 'faker'

# require_relative 'seeds/books'
# require_relative 'seeds/authors'
# require_relative 'seeds/rating'
# require_relative 'seeds/users'

RatingBook.destroy_all

Book.all.each do |book|
  User.all.each do |user|
    RatingBook.create(book_id: book.id, user_id: user.id, rating_id: rand(Rating.first.id..Rating.last.id))
  end
end

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
