require_relative '../repositories/repository'
require_relative 'book'

class Library
  @@numberOfBooks = 0
  @@books = []

  def initialize(name)
    @name = name
  end

  def get_name
    return @name
  end

  def get_all_books
    return @@repositories.getAllBooks
  end
end