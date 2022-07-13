# frozen_string_literal: true

class CreateRatingBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :rating_books do |t|
      t.references :book, index: true
      t.references :user, index: true
      t.references :rating, index: true

      t.timestamps
    end
    add_index :rating_books, %i[book_id user_id rating_id], unique: true
  end
end
