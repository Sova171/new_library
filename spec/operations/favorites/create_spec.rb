# frozen_string_literal: true

require 'rails_helper'
require 'faker'

describe ::Favorites::Create do
  let(:user) { create(:user) }
  let(:book) { create(:book).decorate }
  subject(:follow_book) { ::Favorites::Create.call(user:, book:) }

  it 'follow book' do
    follow_book
    expect(book.followed_by?(user)).to eql(true)
  end
end
