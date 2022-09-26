# frozen_string_literal: true

require 'rails_helper'

describe ::Books::BookRating do
  subject { described_class.call(book:) }

  let(:book)          { create(:book).decorate }
  let(:bad_rating)    { create(:bad_rating) }
  let(:pretty_rating) { create(:pretty_rating) }

  before do
    FactoryBot.create_list(:rating_book, 5, book:, rating: pretty_rating)
    FactoryBot.create_list(:rating_book, 3, book:, rating: bad_rating)
  end

  it 'returns the correct rating' do
    expect(subject['Pretty']).to eql(5)
    expect(subject['Bad']).to eql(3)
  end
end
