# frozen_string_literal: true

class RatingBook < ApplicationRecord
  belongs_to :book
  belongs_to :user
  belongs_to :rating
end
