# frozen_string_literal: true
require_relative '../models/book'

class UserEntriesHandler
  def create_book_instance
    puts "Insert book name: "
    book_name = gets.to_s
    puts "Insert book page amount: "
    book_pages = gets.to_i

    if book_pages == 0
      throw Exception.new 'Invalid pages amount'
    end

    puts "Insert book's rating"
    book_rating = gets

    if book_rating.to_f == 0
      book_rating = nil
    else if book_rating.to_f < 0 || book_rating.to_f > 5
           book_rating = nil
         else
           book_rating = book_rating.to_f
         end
    end

    Book.new book_name, book_pages, book_rating.nil? ? (0) : book_rating
  end
end
