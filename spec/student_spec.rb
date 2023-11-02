require 'spec_helper'

describe Student do
  before :each do
    @student = Student.new(25, name: 'Bianca', parent_permission: true)
  end

  describe '#new' do
    it 'Return a new student object' do
      @student.should(be_an_instance_of(Student))
    end

    it 'throws an ArgumentError' do
      -> { Student.new }.should raise_exception ArgumentError
    end
  end

  describe '#atributes' do
    it 'returns the age' do
      @student.age.should eql 25
    end

    it 'returns the name' do
      @student.name.should eql 'Bianca'
    end
  end
end
