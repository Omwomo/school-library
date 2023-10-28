require './app'

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

def main
  people = []
  books = []

  loop do
    display_options

    choice = gets.chomp.to_i

    case choice
    when 1
      list_all_books(books)
    when 2
      list_all_people(people)
    when 3
      create_person(people)
    when 4
      create_book(books)
    when 5
      create_rental(books, people)
    when 6
      print 'Enter person id: '
      person_id = gets.chomp.to_i
      list_rentals_for_person(person_id, people)
    when 7
      break
    else
      puts 'Invalid choice. Please try again.'
    end
  end
end

main
