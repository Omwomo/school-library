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
end
