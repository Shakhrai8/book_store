require 'book_repository'

RSpec.describe BookRepository do
  def reset_books_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_books_table
  end

  it "returns a list of books" do
    repo = BookRepository.new

    books = repo.all

    expect(books.length).to eq 2 # =>  2

    expect(books.first.id) # =>  1
    expect(books.first.title).to eq 'Nineteen Eighty-Four' # =>  'Nineteen Eighty-Four'
    expect(books.first.author_name).to eq 'George Orwell' # =>  'George Orwell'
  end
end