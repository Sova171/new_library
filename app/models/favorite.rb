class Favorite < ApplicationRecord
  belongs_to :book, class_name: "Book"
  belongs_to :user, class_name: "User"

  validates :book_id, presence: true
  validates :user_id, presence: true
end
