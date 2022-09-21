# frozen_string_literal: true

require 'rails_helper'
require 'faker'

describe ::BooksLists::Create do
  subject(:creates_list) { ::BooksLists::Create.call(book:, list:) }

  let(:book) { create(:book) }
  let(:list) { create(:list) }

  it 'creates new book list' do
    expect { creates_list }.to change(BooksList, :count).by(1)
  end
end
