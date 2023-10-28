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
