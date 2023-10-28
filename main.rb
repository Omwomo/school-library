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
    person = create_person(people)
    people << person if person
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

  CHOICE_ACTIONS = {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_for_person,
    7 => :exit
  }.freeze

  def handle_choice(choice, books, people)
    action = CHOICE_ACTIONS[choice]

    if action
      send(action, books, people)
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
