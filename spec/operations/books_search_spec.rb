# frozen_string_literal: true

require 'rails_helper'
require 'faker'

describe ::Books::Search, search: true do
  before(:each) do
    Book.create(title: 'Yard', description: Faker::TvShows::FamilyGuy.quote)
    Book.create(title: 'Upper Yard', description: Faker::TvShows::FamilyGuy.quote)
    Book.create(title: 'Potter', description: Faker::TvShows::FamilyGuy.quote)
    Book.create(title: 'Friends', description: Faker::TvShows::FamilyGuy.quote)
    Book.create(title: 'Upper friends', description: Faker::TvShows::FamilyGuy.quote)
    Book.search_index.refresh
  end

  it 'no results' do
    result = ::Books::Search.call(search: 'Upper Dot')
    expect(result.count).to eql(0)
  end

  it '1 result' do
    result = ::Books::Search.call(search: 'Potter')
    expect(result.count).to eql(1)
  end

  it '2 results' do
    result = ::Books::Search.call(search: 'Upper')
    expect(result.count).to eql(2)
  end

  it 'search by one letter' do
    result = ::Books::Search.call(search: 'e')
    expect(result.all? { |book| book.title.include?('e') }).to eql(true)
    expect(result.count).to eql(4)
  end

  it 'search by one storage' do
    result = ::Books::Search.call(search: 'ends')
    expect(result.all? { |book| book.title.include?('ends') }).to eql(true)
    expect(result.count).to eql(2)
  end

  it 'search by one word' do
    result = ::Books::Search.call(search: 'Yard')
    expect(result.count).to eql(2)
  end
end
