# frozen_string_literal: true

require 'rails_helper'
require 'faker'

describe ::RatingBooks::Destroy do
  let(:user) { create(:user) }
  let(:rating) { create(:rating) }
  let(:book) { create(:book).decorate }
  subject(:create_rate) { ::RatingBooks::Create.call(user:, book:, rating:) }
  subject(:destroy_rate) { ::RatingBooks::Destroy.call(user:, book:) }

  it 'delete a rating' do
    create_rate
    destroy_rate
    expect(book.rated_by?(user)).to eql(false)
  end
end
