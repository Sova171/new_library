# frozen_string_literal: true

class BooksList < ApplicationRecord
  belongs_to :book
  belongs_to :list

  validates :book_id, presence: true
  validates :list_id, presence: true
end
