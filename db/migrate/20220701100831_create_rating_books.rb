# frozen_string_literal: true

class CreateRatingBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :rating_books do |t|
      t.integer :book_id
      t.integer :user_id
      t.integer :rating_id

      t.timestamps
    end
    add_index :rating_books, :book_id
    add_index :rating_books, :user_id
    add_index :rating_books, :rating_id
    add_index :rating_books, %i[book_id user_id rating_id], unique: true
  end
end
