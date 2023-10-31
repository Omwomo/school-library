# rubocop:disable Metrics/CyclomaticComplexity
def handle_choice(choice, books, people)
  case choice
  when 1 then list_all_books(books)
  when 2 then list_all_people
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
