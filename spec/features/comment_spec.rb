# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Book commentary', type: :feature do
  subject do
    visit book_path(random_book)

    fill_in 'You can live your comment here', with: comment
    click_button 'Add comment'
  end

  let(:user)          { create(:user) }
  let(:comment)       { content }
  let(:book_list)     { create_list(:book, 4) }
  let(:random_book)   { book_list.sample }
  let(:alert_message) { 'Invalid comment (length must be in range 1..500)' }

  before do
    book_list
    Book.reindex

    login_as user, scope: :user

    subject
  end

  context 'when comment is invalid' do
    context 'content is empty' do
      let(:content) { nil }

      it 'return alert message' do
        expect(page).to have_content(alert_message)
      end
    end

    context 'content length eql 501' do
      let(:content) { SecureRandom.base58(501) }

      it 'return alert message' do
        expect(page).to have_content(alert_message)
      end
    end
  end

  context 'when comment is valid' do
    let(:content) { Faker::JapaneseMedia::OnePiece.quote }

    it 'create new comment' do
      expect(page).to have_content(user.email)
      expect(page).to have_content(comment)
    end
  end
end
