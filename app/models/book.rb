# frozen_string_literal: true

class Book < ApplicationRecord
  include PublicActivity::Model
  extend Pagy::Searchkick
  tracked owner: proc { |controller| controller&.current_admin_user }

  MIN_DESCRIPTION_LENGTH = 5

  searchkick text_middle: %i[title]
  has_one_attached :cover
  has_and_belongs_to_many :authors
  # books of list
  has_many :books_lists, foreign_key: :book_id, dependent: :destroy
  has_many :books_of_list, through: :books_lists, source: :list
  # favorites of user
  has_many :favorites, foreign_key: :book_id, dependent: :destroy
  has_many :favorites_book, through: :favorites, source: :user

  has_many :rating_books

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: MIN_DESCRIPTION_LENGTH }

  enum category: {
    biography: 'biography',
    detective: 'detective',
    fantasy:   'fantasy',
    mystery:   'mystery',
    horror:    'horror',
    other:     'other'
  }
end
