class Rover
  @@pos = %w(N E S W)
  attr_reader :x, :y, :p
  def initialize(x=1,y=1,p='N')
    if x < 0 || y < 0 || !@@pos.include?(p)
      raise ArgumentError.new("Not a valid argument")
    end
    @x = x
    @y = y
    @p = p
  end

  def instruction(str)
    str.chars.each do |ins|
      if ins == 'M'
        move
      elsif ins == 'R'
        @p = @@pos[(@@pos.index(@p) + 1)% @@pos.count]
      elsif ins == 'L'
        @p = @@pos[(@@pos.index(@p) + @@pos.count - 1)% @@pos.count]
      else
        raise "Unknown instruction"
      end
    end
  end

  def move
    case @p
    when 'N'
      @y += 1
    when 'S'
      @y -= 1
    when 'E'
      @x += 1
    when 'W'
      @x -= 1
    end
  end

  def to_s
    "#{@x} #{@y} #{@p}"
  end

end
