class ListDecorator < ApplicationDecorator
  def book_in_list?(book)
    books_of_list.include?(book)
  end

  def add_book_to_list(book)
    books_lists.create(book_id: book.id)
  end

  def delete_book_from_list(book)
    books_lists.find_by(book_id: book.id).destroy
  end
end
