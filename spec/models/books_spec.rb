# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should have_one_attached(:cover) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(5) }
    it { should define_enum_for(:category).backed_by_column_of_type(:string) }
  end
end
