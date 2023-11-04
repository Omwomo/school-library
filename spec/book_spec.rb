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

    it 'Book self .from_json' do
      @json_book = {
        'title' => 'House of Terror',
        'author' => 'Steve Ford'
      }
      new_book = Book.from_json(@json_book)
      new_book.title.should eql @book.title
      new_book.author.should eql @book.author
    end

    it 'Save books' do
      books = [Book.new('House of Terror', 'Steve Ford'), Book.new('Animals', 'Steve Chevrolet')]

      allow(File).to receive(:write)
      save_books(books)

      expect(File).to have_received(:write).with('storage/books.json', anything)
    end

    it 'load books from a file' do
      allow(File).to receive(:exist?).and_return(true)
      allow(File).to receive(:read).and_return('[{"title":"Sheep","author": "Bianca"}]')

      loaded_books = load_books

      expect(loaded_books.size).to eq(1)
      expect(loaded_books[0].title).to eq('Sheep')
      expect(loaded_books[0].author).to eq('Bianca')
    end
  end
end
