# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe ::Books::ShowFacade do
  context 'book rating' do
    before(:each) do
      @book = create(:book)
    end

    it 'chart' do
      array = [create(:rating), create(:rating), create(:rating)]
      5.times do
        ::RatingBooks::Create.call(user: create(:user), book: @book.decorate, rating: array.sample)
      end
      facade = ::Books::ShowFacade.new(book: @book, user: create(:user))
      expect(facade.book_rating(@book).count).to eql(3)
    end
  end
end
