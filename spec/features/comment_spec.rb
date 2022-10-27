# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Book commentary', type: :feature do
  subject do
    visit book_path(random_book)

    fill_in 'You can live your comment here', with: comment
    click_button 'Add comment'
  end

  let(:user)        { create(:user) }
  let(:comment)     { Faker::JapaneseMedia::OnePiece.quote }
  let(:book_list)   { create_list(:book, 4) }
  let(:random_book) { book_list.sample }

  before do
    book_list
    Book.reindex
  end

  context 'when user doesnt authenticate' do
    before do
      subject
    end

    it 'redirect to sign in page' do
      expect(page).to have_current_path(user_session_path)
    end
  end

  context 'when user authenticate' do
    before do
      visit user_session_path

      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      subject
    end

    it 'create new comment' do
      expect(page).to have_content(user.email)
      expect(page).to have_content(comment)
    end
  end
end
