# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User Registration', type: :feature do
  subject { click_button 'Sign up' }

  before(:each) do
    visit new_user_registration_path
  end

  context 'when user tries submits to the form' do
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
      before(:each) do
        fill_in 'Password',              with: 'Password'
        fill_in 'Password confirmation', with: 'Password'
      end

      context 'where are all correct' do
        before do
          fill_in 'Email', with: 'vlad@gmail.com'
        end

        it 'will create a user account and redirect to root path' do
          expect { subject }.to change { User.count }.by(1)
          expect(page).to have_current_path(root_path)
        end
      end

      context 'where is invalid email' do
        before do
          fill_in 'Email', with: 'wrong_email'
        end

        it 'will not create a user account' do
          expect { subject }.to_not(change { User.count })
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
end
