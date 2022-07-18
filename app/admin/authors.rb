# frozen_string_literal: true

ActiveAdmin.register Author do
  permit_params :full_name, :date_of_birth, :biography
end
