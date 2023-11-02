require './person'

module StudentRegistry
  @all_students = []

  def self.add_student(student)
    @all_students << student
  end

  def self.all_students
    @all_students
  end
end

class Student < Person
  attr_accessor :name

  def initialize(age, name: 'Unknown', parent_permission: true, classroom: nil)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    StudentRegistry.add_student(self) # Add the student to the registry
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
