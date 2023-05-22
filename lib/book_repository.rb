require_relative './book'

class BookRepository
  def all
    books = []
    #defining sql query string
    sql = 'SELECT id, title, author_name FROM books;'
    #executes sql query and passes sql string and an empty array as an argument
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |book|
      #for each book it creates a new instance and assigns corresponding atributes
      book_inst = Book.new

      book_inst.id = book['id']
      book_inst.title = book['title']
      book_inst.author_name = book['author_name']

      books << book_inst
    end

    return books
  end
end