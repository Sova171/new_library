# frozen_string_literal: true

class BookDecorator < ApplicationDecorator
  def followed_by?(user)
    user.favorites_book.include?(book)
  end

  def rated_by?(user)
    user.rating.include?(book)
  end
end
