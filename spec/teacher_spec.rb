require 'spec_helper'
require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new(25, 'doctor', name: 'Bianca', parent_permission: true)
  end

  describe '#new' do
    it 'takes four parameters and returns a teacher object' do
      expect(@teacher).to be_an_instance_of(Teacher)
    end

    it 'throws an ArgumentError' do
      expect { Teacher.new }.to raise_exception(ArgumentError)
    end
  end

  describe '#attributes' do
    it 'returns the age' do
      expect(@teacher.age).to eql 25
    end

    it 'returns the name' do
      expect(@teacher.name).to eql 'Bianca'
    end

    it 'returns the specialization' do
      expect(@teacher.specialization).to eql 'doctor'
    end
  end
end
