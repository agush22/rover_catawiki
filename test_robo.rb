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

  it "can turn left" do
    rover = Rover.new(1,1,'N')
    rover.instruction('L')
    rover.p.must_equal 'W'
    rover.instruction('L')
    rover.p.must_equal 'S'
    rover.instruction('L')
    rover.p.must_equal 'E'
    rover.instruction('L')
    rover.p.must_equal 'N'
  end

  it "can turn right" do
    rover = Rover.new(1,1,'N')
    rover.instruction('R')
    rover.p.must_equal 'E'
    rover.instruction('R')
    rover.p.must_equal 'S'
    rover.instruction('R')
    rover.p.must_equal 'W'
    rover.instruction('R')
    rover.p.must_equal 'N'
  end

  it "can move north" do
    rover = Rover.new(1,1,'N')
    rover.move
    rover.y.must_equal 2
  end

  it "can move south" do
    rover = Rover.new(1,1,'S')
    rover.move
    rover.y.must_equal 0
  end

  it "can move east" do
    rover = Rover.new(1,1,'E')
    rover.move
    rover.x.must_equal 2
  end

  it "can move west" do
    rover = Rover.new(1,1,'W')
    rover.move
    rover.x.must_equal 0
  end

  it "can not move past north boundary" do
    lambda {Rover.new(5,5,'N', 5, 5).move}.must_raise(RuntimeError)
  end

  it "can not move past south boundary" do
    lambda {Rover.new(0,0,'S', 5, 5).move}.must_raise(RuntimeError)
  end

  it "can not move past east boundary" do
    lambda {Rover.new(5,0,'E', 5, 5).move}.must_raise(RuntimeError)
  end

  it "can not move past west boundary" do
    lambda {Rover.new(0,0,'W', 5, 5).move}.must_raise(RuntimeError)
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
    rover.x.must_equal 1
    rover.y.must_equal 3
    rover.p.must_equal 'N'
  end

  it "can move with a string of instructions and report position" do
    rover = Rover.new(3,3,'E')
    rover.instruction('MMRMMRMRRM')
    rover.to_s.must_equal '5 1 E'
  end
end
