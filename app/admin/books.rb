# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :title, :description, :pages_count,
                :published_at, :publisher, :cover, author_ids: []

  index do
    selectable_column
    column :title
    column :description
    column :pages_count
    column :published_at
    column :publisher
    column :authors
    column t('.image') do |book|
      if book.cover.attached?
        image_tag book.cover, width: '50'
      else
        image_tag 'NoBookCover.png', width: '50'
      end
    end
    actions
  end

  show do
    attributes_table do
      row :title
      row :cover do |book|
        if book.cover.attached?
          image_tag book.cover, width: '100'
        else
          image_tag 'NoBookCover.png', width: '100'
        end
      end
      row :description
      row :pages_count
      row :published_at
      row :publisher
      row :authors
    end

    panel 'Activity' do
      table_for book.activities.push(book.favorites.map(&:activities).flatten) do
        column :owner_type
        column :owner
        column :key
        column :created_at
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :cover, as: :file
      f.input :author_ids, as: :tags, collection: Author.all, display_name: :full_name
      f.input :title
      f.input :description
      f.input :pages_count
      f.input :published_at
      f.input :publisher
    end
    f.actions
  end

  filter :authors
  filter :pages_count
end
