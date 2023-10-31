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

  # Serialize the object to a hash
  def to_json
    {
      'date' => @date,
      'person' => @person,
      'book' => @book,
    }
  end

  # Deserialize the hash back into an object
  def self.from_json(json_hash)
    self.new(json_hash['date'], json_hash['person'], json_hash['book'])
  end
end

def save_rental(rental)
  File.open('storage/rental.json', 'w') do |file|
    file.write(JSON.dump(rental))
  end
end

def load_rental
  loaded_rental_data = JSON.parse(File.read('storage/rental.json'))
  loaded_rental = []

  loaded_rental_data.each do |rental_data|
    loaded_rental << rental.from_json(rental_data)
  end

  loaded_rental
end
