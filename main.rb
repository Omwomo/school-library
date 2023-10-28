require './app.rb'

def main
  people = []
  books = []
  loop do
    puts "\nOptions:"
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List rentals for a person"
    puts "7. Quit"

    choice = gets.chomp.to_i

    case choice
    when 1
      list_all_books(books)
    when 2
      list_all_people(people)
    when 3
      print "Enter name: "
      name = gets.chomp
      print "Enter age: "
      age = gets.chomp.to_i
      print "Enter type (teacher/student): "
      type = gets.chomp.downcase
      person = create_person(name, age, type)
      people << person if person
    when 4
      print "Enter title: "
      title = gets.chomp
      print "Enter author: "
      author = gets.chomp
      book = create_book(title, author)
      books << book
    when 5
      print "Enter date (YYYY-MM-DD): "
      date = gets.chomp
      print "Enter book title: "
      title = gets.chomp
      print "Enter person id: "
      person_id = gets.chomp.to_i
      book = books.find { |b| b.title == title }
      person = people.find { |p| p.id == person_id }
      create_rental(date, book, person) if book && person
    when 6
      print "Enter person id: "
      person_id = gets.chomp.to_i
      list_rentals_for_person(person_id)
    when 7
      break
    else
      puts "Invalid choice. Please try again."
    end
  end
end

main()
