# frozen_string_literal: true

require 'rails_helper'

describe ::Favorites::Destroy do
  subject { ::Favorites::Destroy.call(user:, book:) }

  let(:user) { create(:user) }
  let(:book) { create(:book).decorate }

  before do
    ::Favorites::Create.call(user:, book:)
  end

  it 'unfollow book' do
    subject
    expect(book.followed_by?(user)).to eql(false)
  end
end
