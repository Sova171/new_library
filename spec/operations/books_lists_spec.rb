# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe ::BooksLists do
  before(:each) do
    @list = create(:list)
    @book = create(:book).decorate
  end

  it 'Create list' do
    ::BooksLists::Create.call(book: @book, list: @list)
    expect(BooksList.exists?(book_id: @book, list_id: @list)).to eql(true)
  end

  it 'Destroy list' do
    ::BooksLists::Create.call(book: @book, list: @list)
    ::BooksLists::Destroy.call(book: @book, list: @list)
    expect(BooksList.exists?(book_id: @book, list_id: @list)).to eql(false)
  end
end
