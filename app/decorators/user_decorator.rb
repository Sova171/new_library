# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  def following_book?(book)
    favorites_book.include?(book)
  end

  def already_rated?(book)
    rating.include?(book)
  end
end
