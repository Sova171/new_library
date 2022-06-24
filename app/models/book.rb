class Book < ApplicationRecord
  has_one_attached :cover
  has_and_belongs_to_many :authors
  
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }
end
