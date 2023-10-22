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
  end
end