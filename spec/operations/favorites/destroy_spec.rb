# frozen_string_literal: true

require 'rails_helper'
require 'faker'

describe ::Favorites::Destroy do
  let(:user) { create(:user) }
  let(:book) { create(:book).decorate }
  subject(:follow_book) { ::Favorites::Create.call(user:, book:) }
  subject(:unfollow_book) { ::Favorites::Destroy.call(user:, book:) }

  it 'unfollow book' do
    follow_book
    unfollow_book
    expect(book.followed_by?(user)).to eql(false)
  end
end
