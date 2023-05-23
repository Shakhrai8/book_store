require_relative './book'

class BookRepository
  def initialize(database_connection)
    @database_connection = database_connection
  end

  def all
    books = []
    sql = 'SELECT id, title, author_name FROM books;'
    result_set = @database_connection.exec_params(sql, [])

    result_set.each do |book|
      book_inst = Book.new
      book_inst.id = book['id']
      book_inst.title = book['title']
      book_inst.author_name = book['author_name']
      books << book_inst
    end

    return books
  end
end
