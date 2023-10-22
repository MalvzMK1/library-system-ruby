require 'minitest/autorun'
require_relative '../repositories/repository'
require_relative '../models/book'

class LocalControllerTestRepository < Repository
  def clear_books
    @@books.clear
  end
end

class LocalBook < Book
end

class ControllerTest < Minitest::Test
  def setup
    @repository = LocalControllerTestRepository.new
  end

  def teardown
    @repository.clear_books
  end

  def test_create_book
  end
end