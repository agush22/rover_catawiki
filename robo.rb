class Rover
  POS = %w(N E S W)

  attr_reader :x, :y, :p, :mx, :my

  def initialize(x=1,y=1,p='N',mx=5, my=5)
    if !x.between?(0, mx) || !y.between?(0, my) || !POS.include?(p)
      raise ArgumentError.new("Not a valid argument")
    end
    @x = x
    @y = y
    @p = p
    @mx = mx
    @my = my
  end

  def instruction(str)
    str.chars.each do |ins|
      if ins == 'M'
        move
      elsif ins == 'R'
        @p = POS[(POS.index(@p) + 1)% POS.count]
      elsif ins == 'L'
        @p = POS[(POS.index(@p) + POS.count - 1)% POS.count]
      else
        raise "Unknown instruction"
      end
    end
  end

  def move
    case @p
    when 'N'
      if @y < @my
        @y += 1
      else
        raise "Can't go out of north boundaries"
      end
    when 'S'
      if @y > 0
        @y -= 1
      else
        raise "Can't go out of south boundaries"
      end
    when 'E'
      if @x < @mx
        @x += 1
      else
        raise "Can't go out of east boundaries"
      end
    when 'W'
      if @x > 0
        @x -= 1
      else
        raise "Can't go out of west boundaries"
      end
    end
  end

  def to_s
    "#{@x} #{@y} #{@p}"
  end

end
