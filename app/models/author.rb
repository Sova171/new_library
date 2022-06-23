class Author < ApplicationRecord
  has_one_attached :avatar

  validates :full_name, presence: true
end
