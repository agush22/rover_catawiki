require 'minitest/autorun'
require 'minitest/pride'
require './robo'

describe Rover do
  it "can be created without arguments" do
    rover = Rover.new
    rover.must_be_instance_of Rover
    rover.x.must_equal 1
    rover.y.must_equal 1
    rover.p.must_equal 'N'
  end
  it "can be created with arguments" do
    rover = Rover.new(3,4,'E')
    rover.must_be_instance_of Rover
    rover.x.must_equal 3
    rover.y.must_equal 4
    rover.p.must_equal 'E'
  end

  it "can not be created with wrong arguments" do
    lambda {Rover.new(3,4,'Y')}.must_raise(ArgumentError)
  end

  it "can move with instructions" do
    rover = Rover.new(1,2,'N')
    rover.instruction('L')
    rover.instruction('M')
    rover.instruction('L')
    rover.instruction('M')
    rover.instruction('L')
    rover.instruction('M')
    rover.instruction('L')
    rover.instruction('M')
    rover.instruction('M')
    rover.x.must_equal 3
    rover.y.must_equal 3
    rover.p.must_equal 'E'
  end

  it "can move with  a string of instructions and report position" do
    rover = Rover.new(3,3,'E')
    rover.instruction('MMRMMRMRRM')
    rover.to_s.must_equal '5 1 E'
  end
end
