# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:full_name) }
  end
end
