class Student < Person
  attr_accessor :classroom

  def initialize(age:, name: 'Unknown', parent_permission: true, classroom: nil)
    super(age, name = 'Unknown', parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
