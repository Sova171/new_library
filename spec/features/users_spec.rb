# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'registrations users' do
    scenario 'empty email and password' do
      visit new_user_registration_path
      click_button 'Sign up'

      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
    end

    scenario 'wrong email' do
      visit new_user_registration_path

      fill_in 'Email',                 with: 'wrong_email'
      fill_in 'Password',              with: 'Password'
      fill_in 'Password confirmation', with: 'Password'

      expect { click_button('Sign up') }.to_not(change { User.count })
    end

    scenario 'email is already registered' do
      create(:user, email: 'vlad@gmail.com')
      visit new_user_registration_path

      fill_in 'Email',                 with: 'vlad@gmail.com'
      fill_in 'Password',              with: 'Password'
      fill_in 'Password confirmation', with: 'Password'

      click_button 'Sign up'
      expect(page).to have_content('Email has already been taken')
    end

    scenario 'user must be registered' do
      visit new_user_registration_path

      fill_in 'Email',                 with: 'vlad@gmail.com'
      fill_in 'Password',              with: 'Password'
      fill_in 'Password confirmation', with: 'Password'

      expect { click_button('Sign up') }.to change { User.count }.by(1)
    end
  end
end
