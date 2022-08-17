# frozen_string_literal: true

class ListDecorator < ApplicationDecorator
  def book_in_list?(book)
    books.include?(book)
  end
end
