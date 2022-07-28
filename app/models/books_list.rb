# frozen_string_literal: true

class BooksList < ApplicationRecord
  include PublicActivity::Model
  tracked
  tracked owner: proc { |controller| controller.current_user }
  belongs_to :book
  belongs_to :list

  validates :book_id, presence: true
  validates :list_id, presence: true
end
