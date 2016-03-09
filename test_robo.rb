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
end
