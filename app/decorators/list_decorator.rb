class ListDecorator < ApplicationDecorator
  def book_in_list?(book)
    books.include?(book)
  end
end
