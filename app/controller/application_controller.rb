require_relative '../models/book'

class Controller
  @@repository = Repository.new

  def add_book(book)
    if book.class != Book
      {
        :message => 'Data should be a Book',
        :status => 400
      }
    else
      {
        :data => @@repository.add_book(book),
        :message => 'Created book successefully!!',
        :status => 201
      }
    end
  end

  def get_all_books
    @@repository.get_all_books
  end

  def delete_book(book_id)
    if book_id.class == Integer
      {
        :data => @@repository.delete_book(book_id),
        :message => 'Book deleted successefully!',
        :status => 200
      }
    else
      {
        :message => 'The provided ID is invalid, should be a number.',
        :status => 400
      }
    end
  end

  def get_books_by_name(book_name)
    @found_books = []
    books = @@repository.get_all_books

    books.each { |book|
      if book.get_infos[:name].include?(book_name)
        @found_books.push(book.get_infos)
      end
    }

    @found_books
  end
end
