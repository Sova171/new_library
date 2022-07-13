# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :book, index: true
      t.references :user, index: true

      t.timestamps
    end
    add_index :favorites, %i[book_id user_id], unique: true
  end
end
