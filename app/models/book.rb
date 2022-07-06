# frozen_string_literal: true

class Book < ApplicationRecord
  MIN_DESCRIPTION_LENGTH = 5
  has_one_attached :cover
  has_and_belongs_to_many :authors
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: MIN_DESCRIPTION_LENGTH }
end
