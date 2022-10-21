# frozen_string_literal: true

require 'rails_helper'

describe ::RatingBooks::Create do
  subject { described_class.call(user:, book:, rating: other_rating) }

  let(:user)          { create(:user) }
  let(:book)          { create(:book).decorate }
  let(:rating)        { create(:rating) }
  let(:other_rating)  { create(:rating) }

  before(:each) do
    create(:rating_book, user:, book:, rating:)
  end

  context 'when user' do
    context 'rates a book for the first time' do
      it 'creates a new record with user rating for this book' do
        expect(user.rating_books.where(book:, rating:)).to exist
      end
    end

    context 'changing the book rating' do
      it 'updates record with user rating for this book' do
        subject
        expect(user.rating_books.where(book:, rating:)).to_not exist
        expect(user.rating_books.where(book:, rating: other_rating)).to exist
      end
    end
  end
end
