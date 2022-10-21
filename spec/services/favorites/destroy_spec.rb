# frozen_string_literal: true

require 'rails_helper'

describe ::Favorites::Destroy do
  subject { described_class.call(user:, book:) }

  let(:user) { create(:user) }
  let(:book) { create(:book).decorate }

  before do
    create(:favorite, user:, book:)
  end

  it "removing a book from the user's favorites list" do
    subject
    expect(book.followed_by?(user)).to eql(false)
  end
end
