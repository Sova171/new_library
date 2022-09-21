# frozen_string_literal: true

require 'rails_helper'
require 'faker'

describe ::Books::ShowFacade do
  context 'does book ' do
    let(:book) { create(:book).decorate }
    subject { ::Books::ShowFacade.new(book:, user: create(:user)) }

    it 'correct count of marks?' do
      Rating.create(title: 'Good')
      Rating.create(title: 'Bad')

      5.times do
        ::RatingBooks::Create.call(user: create(:user), book:, rating: Rating.first)
      end

      3.times do
        ::RatingBooks::Create.call(user: create(:user), book:, rating: Rating.second)
      end

      expect(subject.book_rating(book)['Good']).to eql(5)
      expect(subject.book_rating(book)['Bad']).to eql(3)
    end
  end
end
