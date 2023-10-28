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

# List all people
def list_all_people(people)
  people.each do |person|
    puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
  end
end
