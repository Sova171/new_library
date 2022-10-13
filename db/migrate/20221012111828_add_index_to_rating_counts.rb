# frozen_string_literal: true

class AddIndexToRatingCounts < ActiveRecord::Migration[7.0]
  def change
    add_index :rating_counts, %i[book_id rating_id count], unique: true
  end
end
