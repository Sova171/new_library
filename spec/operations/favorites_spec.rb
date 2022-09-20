# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe ::Favorites do
  before(:each) do
    @user = create(:user)
    @book = create(:book).decorate
  end

  it 'Add book to favorites' do
    ::Favorites::Create.call(user: @user, book: @book)
    expect(@book.followed_by?(@user)).to eql(true)
  end

  it 'Delete book from favorites' do
    ::Favorites::Create.call(user: @user, book: @book)
    ::Favorites::Destroy.call(user: @user, book: @book)
    expect(@book.followed_by?(@user)).to eql(false)
  end
end
