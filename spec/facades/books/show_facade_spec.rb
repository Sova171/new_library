# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe ::Books::ShowFacade do
  context 'book rating' do
    before(:each) do
      @book = create(:book)
    end

    it 'chart' do
      rating_1 = create(:rating)
      rating_2 = create(:rating)
      rating_3 = create(:rating)
      ::RatingBooks::Create.call(user: create(:user), book: @book.decorate, rating: rating_1)
      ::RatingBooks::Create.call(user: create(:user), book: @book.decorate, rating: rating_2)
      ::RatingBooks::Create.call(user: create(:user), book: @book.decorate, rating: rating_2)
      ::RatingBooks::Create.call(user: create(:user), book: @book.decorate, rating: rating_3)
      ::RatingBooks::Create.call(user: create(:user), book: @book.decorate, rating: rating_3)
      ::RatingBooks::Create.call(user: create(:user), book: @book.decorate, rating: rating_3)
      facade = ::Books::ShowFacade.new(book: @book, user: create(:user))
      vote = facade.book_rating(@book)
      expect(vote.count).to eql(3)
    end
  end
end
