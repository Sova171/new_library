# frozen_string_literal: true

require 'rails_helper'

describe ::Books::ShowFacade do
  describe '#book_rating' do
    subject { described_class.new(book:, user:) }

    let(:user) { create(:user) }
    let(:book) { create(:book).decorate }
    let(:bad_rating) { create(:bad_rating) }
    let(:pretty_rating) { create(:pretty_rating) }

    it 'is the rating correct?' do
      5.times do
        create(:rating_book, user: create(:user), book:, rating: pretty_rating)
      end

      3.times do
        create(:rating_book, user: create(:user), book:, rating: bad_rating)
      end

      expect(subject.book_rating['Pretty']).to eql(5)
      expect(subject.book_rating['Bad']).to eql(3)
    end
  end
end
