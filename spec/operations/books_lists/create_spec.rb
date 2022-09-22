# frozen_string_literal: true

require 'rails_helper'

describe ::BooksLists::Create do
  subject { ::BooksLists::Create.call(book:, list:) }

  let(:book) { create(:book) }
  let(:list) { create(:list) }

  it 'creates new book list' do
    expect { subject }.to change(BooksList, :count).by(1)
  end
end
