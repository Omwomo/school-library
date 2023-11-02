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
end
