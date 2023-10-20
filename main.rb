require_relative 'models/library'
require_relative 'models/book'
require_relative 'repositories/repository'
require_relative 'controller/application_controller'

def main
  controller = Controller.new

  puts controller.add_book(Book.new('Livro', 256, 4.5, 1))
  puts controller.add_book('')
end

main
