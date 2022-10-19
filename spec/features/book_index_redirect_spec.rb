# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Book index redirect', type: :feature do
  before(:each) do
    create(:book)
    Book.reindex

    visit root_path
  end

  context 'user search:' do
    it 'specific world' do
      fill_in 'Book title', with: 'Yard'
      click_button 'Search'
      expect(page).to have_current_path('/searches?search=Yard')
    end

    it 'nothing' do
      fill_in 'Book title', with: ''
      click_button 'Search'
      expect(page).to have_current_path(root_path)
    end
  end

  context 'when user pick category:' do
    it 'all categories' do
      find('#filter-categories').click
      find('.dropdown-item', text: 'all categories').click
      expect(page).to have_current_path(root_path)
    end

    it 'biography' do
      find('#filter-categories').click
      find('.dropdown-item', text: 'biography').click
      expect(page).to have_current_path('/books?category%5B%5D=biography&category%5B%5D=biography')
    end

    it 'horror' do
      find('#filter-categories').click
      find('.dropdown-item', text: 'horror').click
      expect(page).to have_current_path('/books?category%5B%5D=horror&category%5B%5D=horror')
    end
  end
end
