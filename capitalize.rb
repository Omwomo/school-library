class CapitalizedDecorator < Decorator
  def correct_name
    super.capitalize
  end
end
