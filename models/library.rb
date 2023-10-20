require_relative '../repositories/repository'

class Library
  @@repository = Repository.new
  @@numberOfBooks = 0
  @@books = []

  def initialize(name)
    @name = name
  end

  def test
    print 'oie'
  end
end