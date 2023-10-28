require './book.rb'
require './person.rb'
require './rental.rb'
require './classroom.rb'
require './teacher.rb'
require './student.rb'

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

# Create a person (teacher or student)
def create_person(name, age, type, parent_permission: true, specialization: nil)
  if type == "teacher"
    person = Teacher.new(age, specialization, name: name, parent_permission: parent_permission)
  elsif type == "student"
    person = Student.new(age, name: name, parent_permission: parent_permission)
  else
    puts "Invalid person type."
    return nil
  end
  person
end

# Create a book
def create_book(title, author)
  Book.new(title, author)
end

# Create a rental
def create_rental(date, book, person)
  Rental.new(date, book, person)
end

# List all rentals for a given person id
def list_rentals_for_person(person_id)
  person = Person.find_by_id(person_id)
  if person.nil?
    puts "Person with ID #{person_id} not found."
    return
  end

  person.rentals.each do |rental|
    puts "Date: #{rental.date}, Book: #{rental.book.title}"
  end
end
