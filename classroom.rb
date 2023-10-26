class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_students(student)
    students << student
    student.classroom = self
  end
end
