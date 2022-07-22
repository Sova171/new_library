# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe List, type: :model do
  before(:each) do
    @list = create(:list)
    @book = create(:book)
  end

  describe 'interaction of list and book' do
    context 'when book' do
      it 'added to the list' do
        @list.add_book_to_list(@book)
        expect(@list.book_in_list?(@book)).to eql(true)
      end

      it 'is not in the list' do
        expect(@list.book_in_list?(@book)).to eql(false)
      end

      it 'removed from the list' do
        @list.add_book_to_list(@book)
        @list.delete_book_from_list(@book)
        expect(@list.book_in_list?(@book)).to eql(false)
      end
    end
  end
end
