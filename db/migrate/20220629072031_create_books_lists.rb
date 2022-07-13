# frozen_string_literal: true

class CreateBooksLists < ActiveRecord::Migration[7.0]
  def change
    create_table :books_lists do |t|
      t.references :book, index: true
      t.references :list, index: true

      t.timestamps
    end
    add_index :books_lists, %i[book_id list_id], unique: true
  end
end
