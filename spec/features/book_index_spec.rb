# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Book index', type: :feature do
  context 'when there are no books on the' do
    let(:nothing) { 'Nothing here yet' }

    before(:each) do |test|
      create(:book, title: 'JO', category: 'other')          unless test.metadata[:focus]
      create(:book, title: 'Joestar', category: 'detective') unless test.metadata[:focus]
      Book.reindex

      visit root_path
    end

    it 'root page', :focus do
      expect(page).to have_content(nothing)
    end

    it 'category: horror' do
      find('#filter-categories').click
      find('.dropdown-item', text: 'horror').click
      expect(page).to have_content(nothing)
    end

    it 'db' do
      fill_in 'Book title', with: 'Yard'
      click_button 'Search'
      expect(page).to have_content('No results')
    end
  end

  context 'must be some books when user is visiting' do
    before(:each) do
      create(:book, title: 'JO')
      create(:book, title: 'Joestar')
      create(:book, title: 'Kujo')
      create(:book, title: 'Higashikata', category: 'horror')
      create(:book, title: 'Giovanna')
      Book.reindex
    end

    it 'first page' do
      visit root_path
      expect(page).to have_content('JO')
      expect(page).to_not have_content('Giovanna')
    end

    it 'second page' do
      visit '/?page=2'
      expect(page).to_not have_content('JO')
      expect(page).to have_content('Giovanna')
    end

    it 'search book' do
      visit root_path
      fill_in 'Book title', with: 'Giovanna'
      click_button 'Search'
      expect(page).to have_content('Giovanna')
    end

    it 'category: horror' do
      visit root_path
      find('#filter-categories').click
      find('.dropdown-item', text: 'horror').click
      expect(page).to have_content('Higashikata')
    end
  end
end
