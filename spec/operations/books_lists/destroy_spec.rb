# frozen_string_literal: true

require 'rails_helper'
require 'faker'

describe ::BooksLists::Destroy do
  subject(:creates_list) { ::BooksLists::Create.call(book:, list:) }
  subject(:destroy_list) { ::BooksLists::Destroy.call(book:, list:) }

  let(:book) { create(:book) }
  let(:list) { create(:list) }

  it 'destroy list' do
    creates_list
    expect { destroy_list }.to change(BooksList, :count).by(-1)
  end
end
