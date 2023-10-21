class Repository
  @@books = []

  def initialize
    puts 'Repository initialized successefully!!!'
  end

  def find_book_index_by_id(book_id)
    index = @@books.index { |book| book.get_infos[:id] == book_id } || -1
    return index
  end

  def get_all_books
    return @@books
  end

  def get_book_by_id(book_id)
    book_index = find_book_index_by_id(book_id)

    if book_index != -1
      return @@books[book_index]
    else
      return nil
    end
  end

  def add_book(book)
    @@books.push(book)
    return @@books
  end

  def delete_book(book_id)
    index = find_book_index_by_id(book_id)

    if index > -1
      @@books.delete_at(index)
      return @@books
    end
  end

  def update_book(book_id, new_book_infos)
    index = @@books.find_index(book)
    @@books[index] = new_book_infos
    return @@books
  end
end