def setup
  set_background_hex 0x000000

  @updater = []
  
  @player = Player.new
  @updater << @player

  1.step(8) do
    @updater << Obstacle.new
  end
end

def update
  @updater.each { |e| e.update }
end

def draw
  @updater.each { |e| e.draw }
end

class Player
  ACCEL_Y = 0.04 * 14
  SPEED_Y = -10

  def initialize
    @x = 100
    @y = height / 2
    @speed_y = 0
  end
  
  def update
    touched = Input.touches.find { |e| e.press? }
    @speed_y = SPEED_Y if touched

    @speed_y += ACCEL_Y
    
    @y += @speed_y
  end
  
  def draw
    set_color_hex 0x4B8CF6
    rect @x - 5, @y - 5, 10, 10
  end
end

class Obstacle
  def initialize
    @x = width + 100
    @y = rand(height)
    @speed_x = -2
    @radius = rand(50)
  end
  
  def update
    @x += @speed_x
  end
  
  def draw
    set_color_hex 0xF0CC3A
    circle @x, @y, @radius
  end
end
