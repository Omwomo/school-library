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

main
