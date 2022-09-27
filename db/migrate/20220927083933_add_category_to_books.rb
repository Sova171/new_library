# frozen_string_literal: true

class AddCategoryToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :category, :string, default: 'other'
  end
end
