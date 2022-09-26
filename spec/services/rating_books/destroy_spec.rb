# frozen_string_literal: true

require 'rails_helper'

describe ::RatingBooks::Destroy do
  subject { described_class.call(user:, book:) }

  let(:user)   { create(:user) }
  let(:book)   { create(:book).decorate }
  let(:rating) { create(:rating) }

  before do
    create(:rating_book, user:, book:)
  end

  it 'delete a rating' do
    subject
    expect(user.rating_books.where(book:, rating:)).to_not exist
  end
end
