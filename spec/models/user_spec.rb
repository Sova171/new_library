# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  describe 'valid' do
    it 'should be valid' do
      user = create(:user)
      expect(user).to be_valid
    end

    it 'should be not valid' do
      new_user = build(:user, email: 'vlad.com')
      expect(new_user).to_not be_valid
    end
  end

  describe 'favorites books' do
    before(:each) do
      @user = create(:user)
      @book = create(:book)
    end

    context 'when user' do
      it 'follows a book, one of their favorites books is returned' do
        @user.follow_book(@book)
        expect(@user.following_book?(@book)).to eql(true)
      end

      it 'doesnt follows a book, one of their favorites books is not returned' do
        expect(@user.following_book?(@book)).to eql(false)
      end

      it 'unfollows a book, one of their favorites books is not returned' do
        @user.follow_book(@book)
        @user.unfollow_book(@book)
        expect(@user.following_book?(@book)).to eql(false)
      end
    end
  end

  describe 'rate of the book by the user' do
    before(:each) do
      @user = create(:user)
      @book = create(:book)
      @rate = create(:rating)
    end

    context 'when user' do
      it 'rated the book' do
        @user.rate_book(@book, @rate.id)
        expect(@user.already_rated?(@book)).to eql(true)
      end

      it 'hasnt rated the book' do
        expect(@user.already_rated?(@book)).to eql(false)
      end

      it 'has deleted the book rating' do
        @user.rate_book(@book, @rate.id)
        @user.delete_rating(@book)
        expect(@user.already_rated?(@book)).to eql(false)
      end
    end
  end
end
