require 'spec_helper'

describe Decorator do
  it 'Correct name returns true' do
    @person = Person.new(24, 'Bianca')
    @person.correct_name.should eql 'Bianca'
  end
end
