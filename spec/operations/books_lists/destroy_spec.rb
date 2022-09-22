# frozen_string_literal: true

require 'rails_helper'

describe ::BooksLists::Destroy do
  subject { described_class.call(book:, list:) }

  let(:book) { create(:book) }
  let(:list) { create(:list) }

  before do
    ::BooksLists::Create.call(book:, list:)
  end

  it 'destroy list' do
    expect { subject }.to change(BooksList, :count).by(-1)
  end
end
