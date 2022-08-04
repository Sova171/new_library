class UserDecorator < ApplicationDecorator
  def follow_book(book)
    favorites.create(book_id: book.id)
  end

  def unfollow_book(book)
    favorites.find_by(book_id: book.id).destroy
  end

  def following_book?(book)
    favorites_book.include?(book)
  end

  def rate_book(book, rating)
    rating_books.create(book_id: book.id, rating_id: rating)
  end

  def delete_rating(book)
    rating_books.find_by(book_id: book.id).destroy
  end

  def already_rated?(book)
    rating.include?(book)
  end
end