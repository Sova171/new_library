class BooksList < ApplicationRecord
  belongs_to :book, class_name: "Book"
  belongs_to :list, class_name: "List"

  validates :book_id, presence: true
  validates :list_id, presence: true
end
