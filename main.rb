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

  def list_rentals(people)
    print 'Enter person id: '
    person_id = gets.chomp.to_i
    list_rentals_for_person(person_id, people)
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def handle_choice(choice, books, people)
    case choice
    when 1 then list_all_books(books)
    when 2 then list_all_people(people)
    when 3 then create_person(people)
    when 4 then create_book(books)
    when 5 then create_rental(books, people)
    when 6 then list_rentals(people)
    when 7 then exit
    else
      puts 'Invalid choice. Please try again.'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

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
