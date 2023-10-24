class Decorator < Nameable
  def initialize(nemeable)
    super()
    @nemeable = nemeable
  end

  def correct_name
    @nemeable.correct_name
  end
end
