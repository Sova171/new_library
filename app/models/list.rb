# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :user

  has_many :books_lists, foreign_key: :list_id, dependent: :destroy
  has_many :books_of_list, through: :books_lists, source: :book

  def add_book_to_list(book)
    books_lists.create(book_id: book.id)
  end

  def delete_book_from_list(book)
    books_lists.find_by(book_id: book.id).destroy
  end

  def book_in_list?(book)
    books_of_list.include?(book)
  end

  validates :name, presence: true
end
