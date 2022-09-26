# frozen_string_literal: true

require 'rails_helper'

describe ::Books::ShowFacade do
  describe '#book_rating' do
    subject { described_class.new(book:, user:) }

    let(:user)          { create(:user) }
    let(:book)          { create(:book).decorate }
    let(:bad_rating)    { create(:bad_rating) }
    let(:pretty_rating) { create(:pretty_rating) }

    before do
      FactoryBot.create_list(:rating_book, 5, book:, rating: pretty_rating)
      FactoryBot.create_list(:rating_book, 3, book:, rating: bad_rating)
    end

    it 'returns the correct rating' do
      expect(subject.book_rating['Pretty']).to eql(5)
      expect(subject.book_rating['Bad']).to eql(3)
    end
  end
end
