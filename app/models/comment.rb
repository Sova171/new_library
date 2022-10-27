# frozen_string_literal: true

class Comment < ApplicationRecord
  MAX_CONTENT_LENGTH = 500

  belongs_to :book
  belongs_to :user

  validates :content, length: { maximum: MAX_CONTENT_LENGTH }
end
