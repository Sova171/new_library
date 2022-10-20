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

    context 'root page' do
      it 'show empty message', :focus do
        expect(page).to have_content(nothing)
      end
    end

    context 'page category: horror' do
      before do
        find('#filter-categories').click
        find('.dropdown-item', text: 'horror').click
      end

      it 'show empty message' do
        expect(page).to have_content(nothing)
      end
    end

    context 'search request' do
      before do
        fill_in 'Book title', with: 'Yard'
        click_button 'Search'
      end

      it 'show no results message' do
        expect(page).to have_content('No results')
      end
    end
  end

  context 'when user is try to' do
    before(:each) do
      create(:book, title: 'JO')
      create(:book, title: 'Joestar', category: 'horror')
      create(:book, title: 'Higashikata', category: 'horror')
      create(:book, title: 'Giovanna', category: 'detective')
      Book.reindex

      visit root_path
    end

    context 'search book' do
      before do
        fill_in 'Book title', with: 'Giovanna'
        click_button 'Search'
      end

      it 'return correct results' do
        expect(page).to have_content('Giovanna')
      end

      it 'return correct page' do
        expect(page).to have_current_path('/searches?search=Giovanna')
      end
    end

    context 'picks category: horror' do
      before do
        find('#filter-categories').click
        find('.dropdown-item', text: 'horror').click
      end

      it 'return all books with horror category' do
        expect(page).to have_content('Joestar')
        expect(page).to have_content('Higashikata')
        expect(page).to_not have_content('Giovanna')
      end

      it 'return correct page' do
        expect(page).to have_current_path('/books?category%5B%5D=horror&category%5B%5D=horror')
      end
    end
  end
end
