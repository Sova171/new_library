# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User Registration', type: :feature do
  subject { click_button 'Sign up' }

  before do
    visit new_user_registration_path
  end

  context 'where are empty email and password' do
    before do
      subject
    end

    it 'displays error message' do
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
    end
  end

  context 'with fields' do
    before do
      fill_in 'Password',              with: 'Password'
      fill_in 'Password confirmation', with: 'Password'
    end

    context 'when params are valid' do
      before do
        fill_in 'Email', with: 'vlad@gmail.com'
        subject
      end

      it 'will create a user account and redirect to root path' do
        expect(page).to have_current_path(root_path)
        expect(page).to have_content('Welcome! You have signed up successfully')
      end
    end

    context 'when email is invalid' do
      before do
        fill_in 'Email', with: 'wrong_email'
        subject
      end

      it 'will not create a user account' do
        expect(page).to have_current_path(user_registration_path)
      end
    end

    context 'where is email is already in db' do
      before do
        create(:user, email: 'vlad@gmail.com')
        fill_in 'Email', with: 'vlad@gmail.com'
        subject
      end

      it 'displays message: email has already been taken' do
        expect(page).to have_content('Email has already been taken')
      end
    end
  end
end
