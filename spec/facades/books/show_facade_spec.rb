# frozen_string_literal: true

require 'rails_helper'

describe ::Books::ShowFacade do
  describe '#book_rating' do
    subject { described_class.new(book:, user:) }

    let(:user) { create(:user) }
    let(:book) { create(:book).decorate }
    let(:creates) { ::RatingBooks::Create }
    let(:pretty_rate) { create(:pretty_rate) }
    let(:bad_rate) { create(:bad_rate) }

    it 'is the rating correct?' do
      5.times do
        creates.call(user: create(:user), book:, rating: pretty_rate)
      end

      3.times do
        creates.call(user: create(:user), book:, rating: bad_rate)
      end

      expect(subject.book_rating['Pretty']).to eql(5)
      expect(subject.book_rating['Bad']).to eql(3)
    end
  end
end
