# frozen_string_literal: true

class RatingBook < ApplicationRecord
  belongs_to :book, class_name: 'Book'
  belongs_to :user, class_name: 'User'
  belongs_to :rating, class_name: 'Rating'
end
