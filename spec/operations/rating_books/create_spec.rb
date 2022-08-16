# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe ::RatingBooks::Create do
  context 'validation tests' do
    before(:each) do
      @user = create(:user)
      @book = create(:book)
    end

    it 'not rated before' do
      rating = create(:rating)
      expect(@book.decorate.rated_by?(@user)).to eql(false)
      ::RatingBooks::Create.call(user: @user, book: @book.decorate, rating:)
      expect(@book.decorate.rated_by?(@user)).to eql(true)
      expect(@user.rating_books.where(book_id: @book.id, rating_id: rating.id)).to exist
    end

    it 'rated before' do
      rating = create(:rating)
      other_rating = create(:rating)
      ::RatingBooks::Create.call(user: @user, book: @book.decorate, rating:)
      expect(@book.decorate.rated_by?(@user)).to eql(true)
      expect(@user.rating_books.where(book_id: @book.id, rating_id: rating.id)).to exist
      expect(@user.rating_books.where(book_id: @book.id, rating_id: other_rating.id)).to_not exist

      ::RatingBooks::Create.call(user: @user, book: @book.decorate, rating: other_rating)
      expect(@user.rating_books.where(book_id: @book.id, rating_id: rating.id)).to_not exist
      expect(@user.rating_books.where(book_id: @book.id, rating_id: other_rating.id)).to exist
    end
  end
end
