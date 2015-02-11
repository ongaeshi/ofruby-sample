def setup
  @field = Field.new(6, 6)
end

def update
  @field.update
end

def draw
  set_no_fill
  @field.draw
end

class Field
  def initialize(x, y)
    @size = Vec2.new(x, y)

    @table = Array.new(x * y)  do
      rand(6).to_i.to_s
    end
  end

  def update
  end

  def get(x, y)
    @table[y * @size.x + x]
  end

  def draw
    0.upto(@size.x-1) do
      y = 5
      text get(x, 0), x * 10, y * 10
    end
  end
end

class Vec2
  attr_accessor :x
  attr_accessor :y
  
  def initialize(x, y)
    @x = x
    @y = y
  end

  def +(rhs)
    Vec2.new(@x + rhs.x, @y + rhs.y)
  end
end
