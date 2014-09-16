X = 50
Y = 50
SX = 220
SY = 380
R = 10

def setup
  # srand 0
  @balls = []
  num = rand(100) + 1
  # num = 5
  1.step(num, 1) do
    @balls.push Ball.new rand(300), rand(300), rand(20), rand(20)
  end
end

def update
  @balls.each { |ball| ball.update }
end

def draw
  set_color_hex 0xecf1f6
  set_fill
  set_line_width 2
  rect X, Y, SX, SY
  @balls.each { |ball| ball.draw }
  
  set_color 0, 0, 0
  text "fps: #{frame_rate}", 10, 25
  text "balls: #{@balls.length}", 10, 40
end

class Ball
  def initialize(x, y, sx, sy)
    @x = x
    @sx = sx
    @y = y
    @sy = sy
    @color = Color.new rand(255), rand(255), rand(255)
  end

  def update
    @x += @sx
    if @x > X + SX - R 
     @sx *= -1
     @x = X + SX - R 
    end
    if @x < X + R     
     @sx *= -1
     @x = X + R     
    end

    @y += @sy 
    if @y > Y + SY - R 
     @sy *= -1
     @y = Y + SY - R 
    end
    if @y < Y + R     
     @sy *= -1
     @y = Y + R     
    end
  end

  def draw
    set_color @color
    set_fill
    ellipse @x, @y, 20, 20
  end
end
