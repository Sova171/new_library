# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe Book, type: :model do
  context 'validation tests' do
    it 'title and description presence' do
      book = Book.create(title: Faker::JapaneseMedia::OnePiece.location, description: Faker::TvShows::FamilyGuy.quote)
      expect(book).to be_valid
    end

    it 'title doesnt presence' do
      book = Book.create(description: Faker::TvShows::FamilyGuy.quote)
      expect(book).to_not be_valid
    end

    it 'description doesnt presence' do
      book = Book.create(title: Faker::JapaneseMedia::OnePiece.location)
      expect(book).to_not be_valid
    end

    it 'title and description presence but description less than 5' do
      book = Book.create(title: Faker::JapaneseMedia::OnePiece.location, description: 'vlad')
      expect(book).to_not be_valid
    end
  end

  context 'relationships between author and book' do
    before(:each) do
      @book = Book.create(title: Faker::JapaneseMedia::OnePiece.location, description: Faker::TvShows::FamilyGuy.quote)
      @author = Author.create(full_name: Faker::TvShows::Friends.character)
    end

    it 'the author does not belong to the book' do
      expect(@book.authors).to be_empty
    end

    it 'the author belong to the book' do
      @book.authors.push(@author)
      expect(@book.authors && @author.books).to_not be_empty
    end
  end
end
