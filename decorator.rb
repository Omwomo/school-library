class Decorator < Nameable
  def initialize(nemeable)
    @nemeable = nemeable
  end

  def correct_name
    @nemeable.correct_name
  end
end
