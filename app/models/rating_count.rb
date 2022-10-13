# frozen_string_literal: true

class RatingCount < ApplicationRecord
  belongs_to :book
  belongs_to :rating
end
