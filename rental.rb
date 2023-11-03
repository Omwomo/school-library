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

  def rental_to_json
    {
      date: @date,
      person: @person.name,
      book: @book.title
    }
  end

  def self.from_json(json_data)
    new(
      json_data['date'],
      Book.new(json_data['book'], ''),
      Person.new(0, '', parent_permission: true, id: json_data['person'])
    )
  end
end


public

def save_rental(rental)
  rentals_data = load_rental
  rentals_data << rental

  file_path = 'storage/rentals.json'

  if File.exist?(file_path)
    File.write(file_path, JSON.generate(rentals_data.map(&:rental_to_json)))
  else
    File.write(file_path, JSON.generate([rental.rental_to_json]))
  end
end

def load_rental
  rentals_data = JSON.parse(File.read('storage/rentals.json'))
  rentals_data.map { |rental_data| Rental.from_json(rental_data) }
end
