# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe Author, type: :model do
  context 'validation tests' do
    it 'name presence' do
      author = Author.create(full_name: Faker::TvShows::Friends.character)
      expect(author).to be_valid
    end

    it 'name doesnt presence' do
      author = Author.create(biography: Faker::JapaneseMedia::OnePiece.quote)
      expect(author).to_not be_valid
    end
  end
end
