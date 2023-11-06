require_relative '../controller/application_controller'
require_relative 'book'

class Library
  @@controller = Controller.new

  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end

  def get_all_books
    @@controller.get_all_books
  end
end