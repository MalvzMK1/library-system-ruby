require 'minitest/autorun'
require_relative '../models/book'
require_relative '../repositories/repository'

class LocalRepository < Repository
  def clear_books # Adding method to clear the @@books array
    @@books.clear
  end
end

class RepositoryTest < Minitest::Test
  def setup # this will run before every test
    @repository = LocalRepository.new
  end
  
  def teardown # this will run after every test
    @repository.clear_books # clearing books to avoid data interference
  end

  def test_find_book_index_by_id
    book1 = Book.new("Book One", 200, 4.5, 1)
    book2 = Book.new("Book Two", 250, 4.0, 2)

    @repository.add_book(book1)
    @repository.add_book(book2)

    assert_equal 0, @repository.find_book_index_by_id(1)
    assert_equal 1, @repository.find_book_index_by_id(2)
    assert_equal -1, @repository.find_book_index_by_id(3)
  end

  def test_add_book
    book = Book.new("New Book", 150, 4.8, 3)
    result = @repository.add_book(book)

    assert_equal 1, result.length
    assert_equal book, result.first
  end

  # def test_delete_book
  #   book = Book.new("Book One", 200, 4.5, 1)
  #   @repository.add_book(book)

  #   result = @repository.delete_book(1)

  #   assert_equal 0, result.length
  # end

  # def test_get_book_by_id
  #   book1 = Book.new("Book One", 200, 4.5, 1)
  #   book2 = Book.new("Book Two", 250, 4.0, 2)

  #   @repository.add_book(book1)
  #   @repository.add_book(book2)

  #   assert_equal book1, @repository.get_book_by_id(1)
  #   assert_equal book2, @repository.get_book_by_id(2)
  #   assert_equal nil, @repository.get_book_by_id(3)
  # end
end
