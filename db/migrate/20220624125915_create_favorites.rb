# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end
    add_index :favorites, :book_id
    add_index :favorites, :user_id
    add_index :favorites, %i[book_id user_id], unique: true
  end
end
