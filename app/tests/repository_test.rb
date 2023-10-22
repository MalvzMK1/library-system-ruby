require 'minitest/autorun'
require_relative '../models/book'
require_relative '../repositories/repository'

class LocalRepositoryTestRepository < Repository
  def clear_books # Adding method to clear the @@books array
    @@books.clear
  end
end

class LocalBook < Book
  def reset_id_count
    @@available_id = 1
  end
end

class RepositoryTest < Minitest::Test
  def setup # this will run before every test
    @repository = LocalRepositoryTestRepository.new
  end
  
  def teardown # this will run after every test
    @repository.clear_books # clearing books to avoid data interference
    LocalBook.new('', 0).reset_id_count # reseting book available id to avoid data interferece
  end

  def test_find_book_index_by_id
    book1 = LocalBook.new("Book One", 200, 4.5)
    book2 = LocalBook.new("Book Two", 250, 4.0)

    @repository.add_book(book1)
    @repository.add_book(book2)

    assert_equal 0, @repository.find_book_index_by_id(1)
    assert_equal 1, @repository.find_book_index_by_id(2)
    assert_equal (-1), @repository.find_book_index_by_id(3)
  end

  def test_add_book
    book = LocalBook.new("New Book", 150, 4.8)
    result = @repository.add_book(book)

    assert_equal 1, result.length
    assert_equal book, result.first
  end

  def test_delete_book
    book = LocalBook.new('Book One', 200, 4.5)

    @repository.add_book(book)

    result = @repository.delete_book(book.get_infos[:id])
    
    assert_equal Integer, book.get_infos[:id].class
    assert_equal 0, result.length
    refute_equal LocalBook, @repository.get_book_by_id(book.get_infos[:id])
  end

  def test_get_book_by_id
    book_one = LocalBook.new('Book One', 200, 4.5)
    book_two = LocalBook.new('Book Two', 250, 5)

    @repository.add_book(book_one)
    @repository.add_book(book_two)

    result = @repository.get_book_by_id(1)

    assert_equal LocalBook, result.class
    assert_equal book_one.get_infos[:id], result.get_infos[:id]
    assert_equal book_one, result
  end

  def test_get_all_books
    book_one = LocalBook.new('Book One', 200, 4.5)
    book_two = LocalBook.new('Book Two', 250, 5)
    book_three = LocalBook.new('Book Three', 400, 3)

    @repository.add_book(book_one)
    @repository.add_book(book_two)
    @repository.add_book(book_three)

    result = @repository.get_all_books

    assert_equal 3, result.length
    for book in result
      assert_equal LocalBook, book.class
    end
  end

  def test_update_book
    book = LocalBook.new('Book One', 200)

    @repository.add_book(book)
    before_update_book = book.get_infos

    assert_equal book.get_infos, before_update_book
    assert_equal 1, book.get_infos[:id]

    updated_book = LocalBook.new('Updated Book', 123)

    assert_equal book, @repository.update_book(1, updated_book)
    after_update_book = @repository.get_book_by_id(1)
    after_update_book = after_update_book.get_infos

    refute_nil after_update_book
    refute_equal before_update_book, after_update_book
    assert_equal 'Updated Book', after_update_book[:name]
    assert_equal before_update_book[:id], after_update_book[:id]
  end
end
