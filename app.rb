require './book.rb'
require './person.rb'
require './rental.rb'
require './classroom.rb'

# List all books
def list_all_books(books)
  books.each do |book|
    puts "Title: #{book.title}, Author: #{book.author}"
  end
end
