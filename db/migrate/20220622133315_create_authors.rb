# frozen_string_literal: true

class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :full_name
      t.date :date_of_birth
      t.text :biography

      t.timestamps
    end
  end
end
