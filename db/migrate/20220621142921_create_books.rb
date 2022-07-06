# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :pages_count
      t.string :published_at
      t.string :publisher

      t.timestamps
    end
  end
end
