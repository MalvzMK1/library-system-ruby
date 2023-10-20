class Repository
  @@books = []

  def initialize
    puts 'Repository initialized successefully!!!'
  end

  def addNewBook(book)
    @@books.push(book)
  end

  def getAllBooks
    return @@books
  end

  def deleteBook(bookId)
    
  end
end
