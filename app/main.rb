require_relative 'models/library'
require_relative 'models/book'
require_relative 'repositories/repository'
require_relative 'controller/application_controller'
require_relative 'utils/user_entries_handler'

def main
  controller = Controller.new
  user_entries_handler = UserEntriesHandler.new

  puts "\n----- Hello, insert the library's name -----\n"
  puts
  library_name = gets

  library = Library.new(library_name)
  title = library.get_name[0].upcase.concat library.get_name[1..]

  while true
    puts "\n----> #{title}"
    puts "\nWhat do you want to do?\n"
    puts "\t1 - Add a book\n\t2 - Delete a book\n\t3 - List all Books\n\t4 - Search by name\n\t5 - Exit"

    selected_option = gets.to_i

    case selected_option
    when 1
      begin
        new_book = user_entries_handler.create_book_instance

        if new_book.class == Book
          controller.add_book new_book
          puts "\n----- Successfully added a book -----\n"
        end
      rescue => error
        puts 'Problems to create a book...'
        puts error
      end
    when 2
      controller.get_all_books.each do |book|
        puts book.get_infos
      end
      puts "\nWhich book you want to delete?"
      delete_book_name = gets.to_s

      selected_book = controller.get_books_by_name delete_book_name

      puts "You want to delete this book?"
      puts selected_book[0].get_infos

      answer = gets.to_s

      if answer[0].downcase == 'y'
        delete_book_id = selected_book[0].get_infos[:id]

        puts controller.delete_book delete_book_id
      end
    when 3
      puts "\n----- Book List -----\n"
      controller.get_all_books.each do |book|
        puts book.get_infos
      end
      puts
    when 4
      puts "Get book by name\nInsert book's name:"
      book_name = gets.to_s

      found_books = controller.get_books_by_name book_name

      found_books.each do |book|
        puts book.get_infos
      end
    when 5
      puts 'Goodbye...'
      break
    else
      puts 'Invalid option'
    end
  end
end

main
