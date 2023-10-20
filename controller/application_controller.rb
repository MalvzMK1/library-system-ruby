require_relative '../models/book'

class Controller
  @@repository = Repository.new

  def add_book(book)
    if (book.class != Book)
      return {
        :message => 'Data should be a Book',
        :status => 400
      }
    else
      return {
        :data => @@repository.add_book(book),
        :message => 'Created book successefully!!',
        :status => 201
      }
    end
  end

  def getAllBooks
    return @@books
  end

  def deleteBook(bookId)
    
  end

  def get_books_by_name(book_name)
    @found_books = []

    for book in @@books
      if book.get_infos[:name].include?(book_name)
        @found_books.push(book.get_infos)
      end
    end

    return @found_books
  end
end
