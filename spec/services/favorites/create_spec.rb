# frozen_string_literal: true

require 'rails_helper'

describe ::Favorites::Create do
  subject { described_class.call(user:, book:) }

  let(:user) { create(:user) }
  let(:book) { create(:book).decorate }

  it "adding a book to the user's favorites list" do
    subject
    expect(book.followed_by?(user)).to eql(true)
  end
end
