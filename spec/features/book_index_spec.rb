# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Book Index', type: :feature do
  before(:each) do
    visit root_path
  end

  context 'user search:' do
    scenario 'Yard' do
      fill_in 'Book title', with: 'Yard'
      click_button 'Search'
      expect(page).to have_current_path('/searches?search=Yard')
    end

    scenario 'nothing' do
      fill_in 'Book title', with: ''
      click_button 'Search'
      expect(page).to have_current_path(root_path)
    end
  end


  context 'when user pick category:' do
    scenario 'all categories' do
      find('#filter-categories').click
      find('.dropdown-item', text: 'all categories').click
      expect(page).to have_current_path(root_path)
    end

    scenario 'biography' do
      find('#filter-categories').click
      find('.dropdown-item', text: 'biography').click
      expect(page).to have_current_path('/books?category%5B%5D=biography&category%5B%5D=biography')
    end

    scenario 'horror' do
      find('#filter-categories').click
      find('.dropdown-item', text: 'horror').click
      expect(page).to have_current_path('/books?category%5B%5D=horror&category%5B%5D=horror')
    end
  end
end
