# frozen_string_literal: true

class Author < ApplicationRecord
  has_one_attached :avatar
  has_and_belongs_to_many :books

  validates :full_name, presence: true
end
