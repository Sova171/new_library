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

  context 'when book is rated by user' do
    it 'for the first time' do
      expect(user.rating_books.where(book:, rating:)).to exist
    end

    it 'changing the book rating' do
      subject
      expect(user.rating_books.where(book:, rating:)).to_not exist
      expect(user.rating_books.where(book:, rating: other_rating)).to exist
    end
  end
end
