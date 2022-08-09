# frozen_string_literal: true

ActiveAdmin.register PublicActivity::Activity do
  permit_params :trackable_type, :trackable_id, :owner_type,
                :owner_id, :key, :parameters, :recipient_type, :recipient_id

  index do
    selectable_column
    column :trackable_type
    column :trackable
    column :owner_type
    column :owner
    column :key
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :trackable_type
      row :trackable
      row :owner_type
      row :owner
      row :key
      row :created_at
    end
  end
end
