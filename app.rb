require './book'
require './person'
require './rental'
require './classroom'
require './teacher'
require './student'

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
def create_person(people)
  print 'Enter name: '
  name = gets.chomp
  print 'Enter age: '
  age = gets.chomp.to_i
  print 'Enter type (teacher/student): '
  type = gets.chomp.downcase

  if type == 'teacher'
    print 'Enter specialization: '
    specialization = gets.chomp
    person = Teacher.new(age, specialization, name: name)
  elsif type == 'student'
    person = Student.new(age, name: name)
  else
    puts 'Invalid person type.'
    return nil
  end

  people << person
  person
end

# Create a book
def create_book(books)
  print 'Enter title: '
  title = gets.chomp
  print 'Enter author: '
  author = gets.chomp

  book = Book.new(title, author)
  books << book
  book
end

# Create a rental
def create_rental(books, people)
  print 'Enter date (YYYY-MM-DD): '
  date = gets.chomp
  print 'Enter book title: '
  title = gets.chomp
  print 'Enter person id: '
  person_id = gets.chomp.to_i

  book = books.find { |b| b.title == title }
  person = people.find { |p| p.id == person_id }

  if book && person
    Rental.new(date, book, person)
  else
    puts "Book with title '#{title}' or person with id '#{person_id}' not found."
  end
end

# List all rentals for a given person id
def list_rentals_for_person(person_id, people)
  person = Person.find_by_id(person_id, people)
  if person.nil?
    puts "Person with ID #{person_id} not found."
    return
  end

  person.rentals.each do |rental|
    puts "Date: #{rental.date}, Book: #{rental.book.title}"
  end
end

