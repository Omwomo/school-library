require 'json'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end

  def to_json
    {
      'date' => @date,
      'person' => @person.name,
      'book' => @book.title
    }
  end

  def self.from_json(json_data)
    self.new(
      json_data['date'],
      Book.new(json_data['book'], ''),
      Person.new(0, '', parent_permission: true, id: json_data['person'])
    )
  end
end

def save_rental(rental)
  rentals_data = load_rental
  rentals_data << rental

  File.open('storage/rentals.json', 'w') do |file|
    file.write(JSON.dump(rentals_data.map(&:to_json)))
  end
end

def load_rental
  begin
    loaded_rentals_data = JSON.parse(File.read('storage/rentals.json'))
    loaded_rentals_data.map { |rental_data| Rental.from_json(rental_data) }
  rescue JSON::ParserError => e
    puts "Error parsing JSON: #{e.message}"
    []
  end
end
