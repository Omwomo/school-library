require 'spec_helper'
require 'date'

describe Rental do
  before :each do
    @book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    @person = Person.new(30, 'John Doe', parent_permission: true)
    @rental_date = Date.new(2023, 11, 1)
    @rental = Rental.new(@rental_date, @book, @person)
  end

  describe '#new' do
    it 'takes three parameters and returns a Rental object' do
      expect(@rental).to be_an_instance_of(Rental)
    end

    it 'adds the rental to the book and person rentals lists' do
      expect(@book.rentals).to include(@rental)
      expect(@person.rentals).to include(@rental)
    end
  end

  describe '#rental_to_json' do
    it 'returns a hash representing the rental' do
      expected_hash = {
        date: @rental_date,
        person: 'John Doe',
        book: 'The Great Gatsby'
      }
      expect(@rental.rental_to_json).to eql(expected_hash)
    end
  end

  describe '#self.from_json' do
    it 'from json' do
      json_data = {
        'date' => '04/10/1996',
        'person' => '814',
        'book' => 'The Lord of the Rings: The Fellowship of the Ring'
      }
      rental = Rental.from_json(json_data)

      expect(rental.book.title).to eq('The Lord of the Rings: The Fellowship of the Ring')
      expect(rental.person.id).to eq('814')
      expect(rental.date).to eq('04/10/1996')
    end
  end

  describe '#save_rental' do
    it 'saves the rental to the storage/rentals.json file' do
      rental = instance_double('Rental', rental_to_json: { date: '2023-11-03', person: 'Jo', book: 'Book' })

      allow(File).to receive(:exist?).and_return(true)
      allow(File).to receive(:read).and_return('[]')
      expect(File).to receive(:write).with('storage/rentals.json',
                                           '[{"date":"2023-11-03","person":"Jo","book":"Book"}]')

      save_rental(rental)
    end
  end

  describe '#load_rental' do
    it 'loads all rentals from the storage/rentals.json file' do
      # Stubbing the File class to prevent actual file operations
      allow(File).to receive(:read).and_return('[]')

      expect(File).to receive(:read).with('storage/rentals.json').and_return('[]') # Expectation added

      loaded_rentals = Rental.load_rental

      expect(loaded_rentals).to be_an(Array) # Additional expectation, checking if loaded_rentals is an array
      expect(loaded_rentals).to be_empty # Additional expectation, checking if loaded_rentals is empty
    end
  end
end
