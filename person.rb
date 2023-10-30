require './nemeable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    @all_people = []
    @all_people << self
  end

  def self.find_by_id(id, people)
    people.find { |person| person.id == id }
  end

  def add_rentals(rental)
    @rentals << rental
    rental.person = self
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
end
