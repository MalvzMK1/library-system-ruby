class Repository
  @@books = []

  def find_book_index_by_id(book_id)
    index = @@books.index { |book| book.get_infos[:id] == book_id } || -1
    index
  end

  def get_all_books
    @@books
  end

  def get_book_by_id(book_id)
    book_index = find_book_index_by_id(book_id)

    if book_index != -1
      @@books[book_index]
    else
      nil
    end
  end

  def add_book(book)
    @@books.push(book)
    @@books
  end

  def delete_book(book_id)
    index = find_book_index_by_id(book_id)

    if index > -1
      @@books.delete_at(index)
      @@books
    end
  end

  def update_book(book_id, new_book_infos)
    index = find_book_index_by_id(book_id)

    @@books[index].update_infos(
      new_book_infos.get_infos[:name],
      new_book_infos.get_infos[:pages],
      new_book_infos.get_infos[:rating]
      )

    @@books[index]
  end
end
