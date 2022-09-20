# frozen_string_literal: true

class Favorite < ApplicationRecord
  include PublicActivity::Model
  tracked
  tracked owner: proc { |controller| controller&.current_user }

  belongs_to :book
  belongs_to :user

  validates :book_id, presence: true
  validates :user_id, presence: true
end
