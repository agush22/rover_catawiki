class Rover
  @@positions = %w(N E S W)
  attr_reader :x, :y, :p
  def initialize(x=1,y=1,p='N')
    if x < 0 || y < 0 || !@@positions.include?(p)
      raise ArgumentError.new("Not a valid argument")
    end
    @x = x
    @y = y
    @p = p
  end
end
