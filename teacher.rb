class Teacher < Person
  @@all_teachers = []
  def initialize(age, specialization, name: 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
    @@all_teachers << self
  end

  def can_use_services
    true
  end
end
