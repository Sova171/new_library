# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe ::RatingBooks do
  before(:each) do
    @user = create(:user)
    @book = create(:book).decorate
    @rating = create(:rating)
  end

  context 'Did the user rate the book?' do
    it 'book was not rated by the user' do
      expect(@book.rated_by?(@user)).to eql(false)
    end

    it 'book was rated by the user' do
      ::RatingBooks::Create.call(user: @user, book: @book, rating: @rating)
      expect(@book.rated_by?(@user)).to eql(true)
    end
  end

  context 'Rating of the book by the user' do
    it 'rating of the book by the user for the first time' do
      ::RatingBooks::Create.call(user: @user, book: @book, rating: @rating)
      expect(@user.rating_books.where(book_id: @book.id, rating_id: @rating.id)).to exist
    end

    it 'changing the book rating by the user' do
      other_rating = create(:rating)
      ::RatingBooks::Create.call(user: @user, book: @book, rating: @rating)
      ::RatingBooks::Create.call(user: @user, book: @book, rating: other_rating)
      expect(@user.rating_books.where(book_id: @book.id, rating_id: @rating.id)).to_not exist
      expect(@user.rating_books.where(book_id: @book.id, rating_id: other_rating.id)).to exist
    end

    it 'delete a rating' do
      ::RatingBooks::Create.call(user: @user, book: @book, rating: @rating)
      ::RatingBooks::Destroy.call(user: @user, book: @book)
      expect(@book.rated_by?(@user)).to eql(false)
    end
  end
end
