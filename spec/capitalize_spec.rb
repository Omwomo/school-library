require 'spec_helper'

describe CapitalizedDecorator do
  it 'Correct name Capitalize ' do
    @person = Person.new(25, 'maximilianus')
    @person_trimer = CapitalizedDecorator.new(@person)
    @person_trimer.correct_name.should eql 'Maximilianus'
  end
end
