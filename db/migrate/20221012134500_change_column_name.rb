# frozen_string_literal: true

class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :rating_counts, :count, :counts
  end
end
