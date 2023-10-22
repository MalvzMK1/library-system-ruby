require 'minitest/autorun'
require_relative '../models/book'
require_relative '../repositories/repository'

class LocalBookTestRepository < Repository
  def clear_books
    @@books.clear
  end
end

class LocalBook < Book
  def reset_id_count
    @@available_id = 1
  end
end

class BookTest < Minitest::Test
  def setup
    @repository = LocalBookTestRepository.new 
  end

  def teardown
    @repository.clear_books
    LocalBook.new('', 0).reset_id_count
  end

  def test_id_auto_gen
    book = LocalBook.new('Book One', 200, 3.5)

    @repository.add_book book
    result = @repository.get_book_by_id 1

    assert_equal 1, result.get_infos[:id]
    assert_equal LocalBook, result.class
  end

  def test_book_instance
    assert_raises ArgumentError do 
      book = LocalBook.new('Book One')
    end
    assert_raises ArgumentError do 
      book = LocalBook.new
    end

    bookOne = LocalBook.new('Book One', 200)
    bookTwo = LocalBook.new('Book Two', 250, 4)

    refute_equal nil, bookOne.get_infos[:rating]
    assert_equal LocalBook, bookOne.class
    assert_equal 1, bookOne.get_infos[:id]
    assert_equal 2, bookTwo.get_infos[:id]
  end

  def test_update_book
    book = LocalBook.new('Book One', 200)

    assert_equal 200, book.get_infos[:pages]
    
    book.update_infos(book.get_infos[:name], 123)

    assert_equal 'Book One', book.get_infos[:name]
    refute_equal 200, book.get_infos[:pages]
  end
end