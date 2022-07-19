# frozen_string_literal: true

ActiveAdmin.register Author do
  permit_params :full_name, :date_of_birth, :biography, :avatar, book_ids: []

  index do
    selectable_column
    column t('.name'), :full_name
    column :date_of_birth
    column :biography
    column :books
    column t('.image') do |author|
      if author.avatar.attached?
        image_tag author.avatar, width: '50'
      else
        image_tag 'NoAvatarImg.png', width: '50'
      end
    end
    actions
  end

  show do
    attributes_table do
      row :full_name
      row :avatar do |author|
        if author.avatar.attached?
          image_tag author.avatar, width: '100'
        else
          image_tag 'NoAvatarImg.png', width: '100'
        end
      end
      row :date_of_birth
      row :biography
      row :books
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :avatar, as: :file
      f.input :book_ids, as: :tags, collection: Book.all, display_name: :title
      f.input :full_name
      f.input :date_of_birth
      f.input :biography
    end
    f.actions
  end

  filter :books
  filter :date_of_birth
end
