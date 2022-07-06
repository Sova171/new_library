# frozen_string_literal: true

class CreateBooksLists < ActiveRecord::Migration[7.0]
  def change
    create_table :books_lists do |t|
      t.integer :book_id
      t.integer :list_id

      t.timestamps
    end
    add_index :books_lists, :book_id
    add_index :books_lists, :list_id
    add_index :books_lists, %i[book_id list_id], unique: true
  end
end
