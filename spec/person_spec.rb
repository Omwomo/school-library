require 'spec_helper'

describe Person do
  let(:person) { Person.new(20, 'John Doe') }

  describe '#initialize' do
    it 'should set default values correctly' do
      expect(person.name).to eq('John Doe')
      expect(person.age).to eq(20)
      expect(person.rentals).to be_empty
      expect(person.instance_variable_get(:@all_people)).to contain_exactly(person)
    end

    it 'should assign a random id if not provided' do
      expect(person.id).to be_an(Integer)
    end

    it 'should assign the provided id if provided' do
      person_with_id = Person.new(20, 'Jane Doe', id: 123)
      expect(person_with_id.id).to eq(123)
    end
  end

  describe '#person=' do
    it 'should set the person and update rentals' do
      person2 = double('Person', rentals: [])
      person.person = person2
      expect(person.instance_variable_get(:@person)).to eq(person2)
      expect(person2.rentals).to contain_exactly(person)
    end
  end

  describe '#correct_name' do
    it 'should return the name' do
      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#can_use_services' do
    it 'should return true if of age' do
      expect(person.can_use_services).to be(true)
    end

    it 'should return true if parent permission is given' do
      person_with_permission = Person.new(17, 'Jane Doe', parent_permission: true)
      expect(person_with_permission.can_use_services).to be(true)
    end
  end

  describe '#people_to_json' do
    it 'should return a hash representation of the person' do
      json_data = person.people_to_json
      expect(json_data).to be_a(Hash)
      expect(json_data).to have_key(:id)
      expect(json_data).to have_key(:name)
      expect(json_data).to have_key(:age)
      expect(json_data).to have_key(:specialization)
    end
  end

  describe '.from_json' do
    it 'should create a new Person from a JSON hash' do
      json_hash = {
        'id' => 123,
        'name' => 'Jane Doe',
        'age' => 25,
      }

      new_person = Person.from_json(json_hash)

      expect(new_person).to be_a(Person)
      expect(new_person.id).to eq(123)
      expect(new_person.name).to eq('Jane Doe')
      expect(new_person.age).to eq(25)
    end
  end

  describe '#add_rentals' do
    it 'should add a rental to the person' do
      person = Person.new(20, 'John Doe')
      book = Book.new('Title', 'Author')
      rental = Rental.new('1999-10-10', book, person)

      expect(person.rentals).to contain_exactly(rental)
    end
  end

  describe '.find_by_id' do
    it 'should find a person by their id' do
      person1 = Person.new(20, 'John Doe', id: 1)
      person2 = Person.new(25, 'Jane Doe', id: 2)
      people = [person1, person2]

      found_person = Person.find_by_id(2, people)

      expect(found_person).to eq(person2)
    end

    it 'should return nil if person with given id is not found' do
      person1 = Person.new(20, 'John Doe', id: 1)
      person2 = Person.new(25, 'Jane Doe', id: 2)
      people = [person1, person2]

      found_person = Person.find_by_id(3, people)

      expect(found_person).to be_nil
    end
  end

  describe 'save_people' do
    it 'should save people to a file' do
      people = [Person.new(20, 'John Doe', id: 1), Person.new(25, 'Jane Doe', id: 2)]

      allow(File).to receive(:write)
      save_people(people)

      expect(File).to have_received(:write).with('storage/people.json', anything)
    end
  end
end
