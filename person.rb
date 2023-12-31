require './nemeable'
require 'json'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals, :specialization

  def initialize(age, name = 'Unknown', parent_permission: true, id: nil)
    super()
    @id = id || Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    @all_people = []
    @all_people << self
  end

  def person=(person)
    @person = person
    person.rentals.push(self) unless person.rentals.include?(self)
  end

  def correct_name
    @name
  end

  private

  def of_age
    @age >= 18
  end

  public

  def can_use_services
    of_age || @parent_permission
  end

  # Serialize the object to a hash
  def people_to_json
    {
      id: @id,
      name: @name,
      age: @age,
      specialization: @specialization
    }
  end

  # Deserialize the hash back into an object
  def self.from_json(json_hash)
    new(json_hash['age'], json_hash['name'], id: json_hash['id'])
  end

  def add_rentals(rental)
    @rentals << rental
    rental.person = self
  end

  def self.find_by_id(id, people)
    people.find { |person| person.id == id }
  end
end

def save_people(people)
  File.write('storage/people.json', JSON.generate(people.map(&:people_to_json)))
end

def load_people
  loaded_people = []
  if File.exist?('storage/people.json')
    loaded_people_data = JSON.parse(File.read('storage/people.json'))

    loaded_people_data.each do |person_data|
      loaded_people << Person.from_json(person_data)
    end
  end

  loaded_people
end
