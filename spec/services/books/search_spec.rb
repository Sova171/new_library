# frozen_string_literal: true

require 'rails_helper'

describe ::Books::Search, search: true do
  subject(:result) { described_class.call(search:) }

  before(:each) do
    create(:book, title: 'Yard')
    create(:book, title: 'Potter')
    create(:book, title: 'Friends')
    create(:book, title: 'Upper Yard')
    create(:book, title: 'Upper friends')
    Book.search_index.refresh
  end

  context 'when search for no exist title' do
    let(:search) { 'Upper Dot' }

    it 'no results' do
      expect(result.count).to eql(0)
    end
  end

  context 'when search by unique title' do
    let(:search) { 'Potter' }

    it '1 result' do
      expect(result.count).to eql(1)
    end
  end

  context 'when search by non unique part of title' do
    let(:search) { 'Upper' }

    it '2 results' do
      expect(result.count).to eql(2)
    end
  end

  context 'when search by one letter' do
    let(:search) { 'e' }

    it 'search by e' do
      expect(result.all? { |book| book.title.include?('e') }).to eql(true)
      expect(result.count).to eql(4)
    end
  end

  context 'when search for one storage' do
    let(:search) { 'ends' }

    it 'search by ends' do
      expect(result.all? { |book| book.title.include?('ends') }).to eql(true)
      expect(result.count).to eql(2)
    end
  end
end
