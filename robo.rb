class Rover
  @@positions = %w(N E S W)
  attr_reader :x, :y, :p
  def initialize(x=1,y=1,p='N')
    @x = x
    @y = y
    @p = p
  end
end
