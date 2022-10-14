# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User Registration', type: :feature do
  subject { click_button 'Sign up' }

  before(:each) do |test|
    visit new_user_registration_path
    fill_in 'Password',              with: 'Password' unless test.metadata[:logged_out]
    fill_in 'Password confirmation', with: 'Password' unless test.metadata[:logged_out]
  end

  context 'shows errors when the user submits to the form' do
    scenario 'empty email and password', :logged_out do
      subject
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
    end

    scenario 'no valid email' do
      fill_in 'Email', with: 'wrong_email'
      expect { subject }.to_not(change { User.count })
    end

    scenario 'email which is already in db' do
      create(:user, email: 'vlad@gmail.com')
      fill_in 'Email', with: 'vlad@gmail.com'

      subject
      expect(page).to have_content('Email has already been taken')
    end
  end

  context 'must be successful when' do
    scenario 'all fields are valid' do
      fill_in 'Email', with: 'vlad@gmail.com'
      expect { subject }.to change { User.count }.by(1)
    end
  end
end
