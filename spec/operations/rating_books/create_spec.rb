# frozen_string_literal: true

require 'rails_helper'

describe ::RatingBooks::Create do
  let(:book) { create(:book).decorate }
  let(:user) { create(:user) }
  let(:rating) { create(:rating) }
  let(:other_rating) { create(:rating) }
  subject(:create_rate) { ::RatingBooks::Create.call(user:, book:, rating:) }
  subject(:create_other_rate) { ::RatingBooks::Create.call(user:, book:, rating: other_rating) }

  context 'check if user' do
    it 'wasnt rated book' do
      expect(book.rated_by?(user)).to eql(false)
    end

    it 'was rated book' do
      create_rate
      expect(book.rated_by?(user)).to eql(true)
    end
  end

  context 'when user' do
    it 'rating book for the first time' do
      create_rate
      expect(user.rating_books.where(book:, rating:)).to exist
    end

    it 'changing the book rating' do
      create_rate
      create_other_rate
      expect(user.rating_books.where(book:, rating:)).to_not exist
      expect(user.rating_books.where(book:, rating: other_rating)).to exist
    end
  end
end
