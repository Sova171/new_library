# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe ::Books::ShowFacade do
  context 'book rating' do
    before(:each) do
      @book = create(:book).decorate
    end

    it 'chart' do
      Rating.create(title: 'Good')
      Rating.create(title: 'Bad')

      5.times do
        ::RatingBooks::Create.call(user: create(:user), book: @book, rating: Rating.first)
      end

      3.times do
        ::RatingBooks::Create.call(user: create(:user), book: @book, rating: Rating.second)
      end

      facade = ::Books::ShowFacade.new(book: @book, user: create(:user))
      expect(facade.book_rating(@book)['Good']).to eql(5)
      expect(facade.book_rating(@book)['Bad']).to eql(3)
    end
  end
end
