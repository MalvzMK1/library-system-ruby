require 'minitest/autorun'
require_relative '../repositories/repository'
require_relative '../models/book'

class LocalControllerTestRepository < Repository
  def clear_books
    @@books.clear
  end
end

class LocalBook < Book
  def reset_id_count
    @@available_id = 1
  end
end

class ControllerTest < Minitest::Test
  def setup
    @repository = LocalControllerTestRepository.new
  end

  def teardown
    @repository.clear_books
    LocalBook.new('', 0).reset_id_count # reseting book available id to avoid data interferece
  end

  def test_create_book
    book = LocalBook.new('Book One', 200)

    assert_equal LocalBook, book.class

    @repository.add_book(book)

    assert_equal book, @repository.get_book_by_id(1)
  end

  def test_get_all_books
    book_one = LocalBook.new('Book One', 200)
    book_two = LocalBook.new('Book Two', 200)
    book_three = LocalBook.new('Book Three', 200)

    @repository.add_book(book_one)
    @repository.add_book(book_two)
    @repository.add_book(book_three)

    all_books = @repository.get_all_books

    assert_equal 3, all_books.length
    assert_equal book_one, @repository.get_book_by_id(1)
    assert_equal book_two.get_infos, @repository.get_book_by_id(2).get_infos
  end
end
