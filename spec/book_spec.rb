require 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('House of Terror', 'Steve Ford')
  end

  describe '#new' do
    it 'Return a new book object' do
      @book.should(be_an_instance_of(Book))
    end

    it 'throws an ArgumentError' do
      -> { Book.new('title') }.should raise_exception ArgumentError
    end
  end

  describe '#methods' do
    it 'returns the title' do
      @book.title.should eql 'House of Terror'
    end

    it 'returns the author' do
      @book.author.should eql 'Steve Ford'
    end

    it 'return rentals empty' do
      @book.rentals.should be_empty
    end

    it 'add a new rental' do
      @person = Person.new(25, 'Bianca')
      @rental = Rental.new('25/05/22', @book, @person)
      @book.add_rental(@rental)
      @book.rentals.should_not be_empty
    end

    it 'book to json' do
      @new_book = @book
      @json = { title: 'House of Terror', author: 'Steve Ford' }
      @new_book.book_to_json.should eql @json
    end

    it 'book from json' do
      @aux = @book
      @json_book = @aux.book_to_json
      Book.from_json(@json_book).should be_an_instance_of Book
    end
  end
end
