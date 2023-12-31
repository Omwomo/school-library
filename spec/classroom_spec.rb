require 'spec_helper'

describe Classroom do
  let(:classroom) { Classroom.new('A101') }

  describe '#initialize' do
    it 'should set label correctly' do
      expect(classroom.label).to eq('A101')
    end

    it 'should initialize students as an empty array' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#classroom=' do
    it 'should associate the classroom with the student' do
      student = double('Student')
      expect(student).to receive(:classroom=).with(classroom)
      classroom.add_students(student)
    end
  end

  describe '#add_students' do
    it 'should add student to the list of students in the classroom' do
      student = double('Student')

      allow(student).to receive(:classroom=)

      classroom.add_students(student)

      expect(classroom.students).to contain_exactly(student)
    end
  end
end
