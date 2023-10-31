require 'json'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
    rental.book = self
  end

  # Serialize the object to a hash
  def to_json(options = nil)
    {
      'title' => @title,
      'author' => @author
    }.to_json(options)
  end

  # Deserialize the hash back into an object
  def self.from_json(json_hash)
    new(json_hash['title'], json_hash['author'])
  end
end

def save_books(books)
  File.write('storage/books.json', JSON.dump(books.map(&:to_json)))
end

def load_books
  loaded_books_data = JSON.parse(File.read('storage/books.json'))
  loaded_books = []

  loaded_books_data.each do |book_data|
    loaded_books << Book.from_json(book_data)
  end

  loaded_books
end
