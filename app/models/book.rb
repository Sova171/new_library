class Book < ApplicationRecord
  has_one_attached :cover

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }
end
