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
    case choice
    when 1
      handle_list_books(books)
    when 2
      handle_list_people(people)
    when 3
      handle_create_person(people)
    when 4
      handle_create_book(books)
    when 5
      handle_create_rental(books, people)
    when 6
      handle_list_rentals(people)
    when 7
      exit
    else
      puts 'Invalid choice. Please try again.'
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
