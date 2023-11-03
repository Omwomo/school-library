require 'spec_helper'
require 'date'
require_relative '../rental'

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

  def self.from_json(json_data)
    new(
      json_data['date'],
      Book.new(json_data['book'], ''),
      Person.new(0, '', parent_permission: true, id: json_data['person'])
    )

    rental = Rental.from_json(json_data)

    expect(rental.date).to eq(Date.parse('2023-11-03'))
    expect(rental.book.title).to eq('The Lord of the Rings: The Fellowship of the Ring')
    expect(rental.book.author).to eq('J.R.R. Tolkien')
    expect(rental.person.id).to eq(123)
  end
end
