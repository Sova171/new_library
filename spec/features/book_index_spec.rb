# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Book index', type: :feature do
  let(:no_books_message) { 'Nothing here yet' }

  context 'when there are no books in db' do
    before do
      visit root_path
    end

    it 'show empty message' do
      expect(page).to have_content(no_books_message)
    end
  end

  context 'when books dont exist in' do
    before do
      FactoryBot.create_list(:book, 4, category: 'other')
      Book.reindex

      visit root_path
    end

    context 'category: horror' do
      before do
        find('#filter-categories').click
        find('.dropdown-item', text: 'horror').click
      end

      it 'show empty message' do
        expect(page).to have_content(no_books_message)
      end
    end

    context 'search request' do
      before do
        fill_in 'Book title', with: 'Lebron James'
        click_button 'Search'
      end

      it 'show no results message' do
        expect(page).to have_content('No results')
      end
    end
  end

  context 'when book exist and user tries to' do
    let(:list) { Book.all }
    let(:random_book) { list.sample }

    before do
      FactoryBot.create_list(:book, 4)
      Book.reindex

      visit root_path
    end

    context 'search book' do
      before do
        fill_in 'Book title', with: random_book.title
        click_button 'Search'
      end

      it 'return correct results' do
        expect(page).to have_content(random_book.title)
      end
    end

    context 'picks category' do
      before do
        find('#filter-categories').click
        find('.dropdown-item', text: random_book.category).click
      end

      it 'return all books with selected category' do
        expect(page).to have_content(random_book.title)
      end

      it 'return correct page' do
        expect(page).to have_current_path(
          "/books?category%5B%5D=#{random_book.category}&category%5B%5D=#{random_book.category}"
        )
      end
    end
  end
end
