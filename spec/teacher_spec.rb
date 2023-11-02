require 'spec_helper'


describe teacher do
  before :each do
    @teacher = teacher.new(25, specialisation: 'doctor', name: 'Bianca', parent_permission: true)
  end

  describe '#new' do
    it 'takes four parameters and returns a teacher object' do
      @teacher.should(be_an_instance_of(teacher))
    end

    it 'throws an ArgumentError' do
      -> { teacher.new }.should raise_exception ArgumentError
    end
  end

  describe '#atributes' do
    it 'returns the age' do
      @teacher.age.should eql 25
    end

    it 'returns the name' do
      @teacher.name.should eql 'Bianca'
    end
  end
end
