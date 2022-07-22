# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe Author, type: :model do
  context 'validation tests' do
    it 'name presence' do
      author = create(:author)
      expect(author).to be_valid
    end

    it 'name doesnt presence' do
      author = build(:author, full_name: nil)
      expect(author).to_not be_valid
    end
  end
end
