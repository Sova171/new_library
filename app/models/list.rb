class List < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 5 }
end
