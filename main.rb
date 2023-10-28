require './app'

class LibraryApp
  def display_options
    puts 'Options:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Quit'
  end

  OPTIONS = {
    1 => :handle_list_books,
    2 => :handle_list_people,
    3 => :handle_create_person,
    4 => :handle_create_book,
    5 => :handle_create_rental,
    6 => :handle_list_rentals,
    7 => :exit
  }.freeze

  def handle_list_books(books)
    list_all_books(books)
  end

  def handle_list_people(people)
    list_all_people(people)
  end

  def handle_create_person(people)
    create_person(people)
  end

  def handle_create_book(books)
    create_book(books)
  end

  def handle_create_rental(books, people)
    create_rental(books, people)
  end

  def handle_list_rentals(people)
    print 'Enter person id: '
    person_id = gets.chomp.to_i
    list_rentals_for_person(person_id, people)
  end

  def handle_choice(choice, books, people)
    option = OPTIONS[choice]

    if option.nil?
      puts 'Invalid choice. Please try again.'
    elsif option == :exit
      exit
    else
      send(option, books, people)
    end
  end

  def main
    people = []
    books = []

    loop do
      display_options

      choice = gets.chomp.to_i

      handle_choice(choice, books, people)
    end
  end
end

app = LibraryApp.new
app.main
