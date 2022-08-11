# frozen_string_literal: true

class List < ApplicationRecord
  include PublicActivity::Model
  tracked
  tracked owner: proc { |controller| controller.current_user }

  belongs_to :user

  has_many :books_lists, foreign_key: :list_id, dependent: :destroy
  has_many :books, through: :books_lists, source: :book

  validates :name, presence: true
end
