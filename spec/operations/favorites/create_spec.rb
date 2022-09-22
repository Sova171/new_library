# frozen_string_literal: true

require 'rails_helper'

describe ::Favorites::Create do
  subject { ::Favorites::Create.call(user:, book:) }

  let(:user) { create(:user) }
  let(:book) { create(:book).decorate }

  it 'follow book' do
    subject
    expect(book.followed_by?(user)).to eql(true)
  end
end
