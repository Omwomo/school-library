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

  describe '#title' do
    it 'returns the title' do
      @book.title.should eql 'House of Terror'
    end
  end

  describe '#author' do
    it 'returns the author' do
      @book.author.should eql 'Steve Ford'
    end
  end
end
