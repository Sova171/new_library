# frozen_string_literal: true

class CreateRatingCounts < ActiveRecord::Migration[7.0]
  def change
    create_table :rating_counts do |t|
      t.references :book, null: false, foreign_key: true
      t.references :rating, null: false, foreign_key: true
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
