# frozen_string_literal: true

class CreateAuthorsBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :authors_books, id: false do |t|
      t.references :author
      t.references :book
      t.timestamps
    end
  end
end
