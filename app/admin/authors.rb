# frozen_string_literal: true

ActiveAdmin.register Author do
  permit_params :full_name, :date_of_birth, :biography, book_ids: []

  index do
    selectable_column
    column 'Name', :full_name
    column :date_of_birth
    column :biography
    column :books
    actions
  end

  form do |f|
    f.inputs do
      f.input :books
      f.input :full_name
      f.input :date_of_birth
      f.input :biography
    end
    f.actions
  end
end
