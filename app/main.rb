require_relative 'models/library'
require_relative 'models/book'
require_relative 'repositories/repository'
require_relative 'controller/application_controller'
require_relative 'utils/user_entries_handler'

def main
  controller = Controller.new
  user_entries_handler = UserEntriesHandler.new

  puts "\n----- Hello, insert the library's name... -----\n"
  library_name = gets

  library = Library.new(library_name)
  title = "\n----- ".concat library.get_name.concat " -----\n"

  # while true
    while true
      puts title
      puts "What do you want to do?"
      puts "1 - Add a book\n2 - Delete a book\n3 - List all Books\n4 - Search by name\n5 - Exit"

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
        puts 'Delete a book'
      when 3
        puts 'List all books'
        controller.get_all_books.each do |book|
          puts book.get_infos
        end
      when 4
        puts 'Search by name'
      when 5
        puts 'Goodbye...'
        break
      else
        puts 'Invalid option'
      end
    end
  end
# end

main
