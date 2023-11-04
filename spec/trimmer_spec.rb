require 'spec_helper'

describe TrimmerDecorator do
  it 'Correct name Trimmer' do
    @person = Person.new(25, 'Maximilianus')
    @person_trimer = TrimmerDecorator.new(@person)
    @person_trimer.correct_name.should eql 'Maximilian'
  end
end
