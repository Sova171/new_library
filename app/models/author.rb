# frozen_string_literal: true

class Author < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller| controller&.current_admin_user }

  has_one_attached :avatar
  has_and_belongs_to_many :books

  validates :full_name, presence: true
end
