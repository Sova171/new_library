# frozen_string_literal: true

class Rating < ApplicationRecord
  has_many :rating_books
  has_many :rating_counts
end
