require './app'
require './handle_choices'

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
