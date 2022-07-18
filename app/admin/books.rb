# frozen_string_literal: true

ActiveAdmin.register Book do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :description, :pages_count, :published_at, :publisher
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :pages_count, :published_at, :publisher]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
