def setup
  @updater = []
  
  @player = Player.new
  @updater << @player
end

def update
  @updater.each { |e| e.update }
end

def draw
  @updater.each { |e| e.draw }
end

class Player
  ACCEL_Y = 0.04

  def initialize
    @x = 100
    @y = height / 2
    @speed_y = 0
  end
  
  def update
    touched = Input.touches.find_all { |e| e.press? }
    @speed_y += -0.1 if touched

    @speed_y += ACCEL_Y
    
    @y += @speed_y
  end
  
  def draw
    set_color_hex 0x4B8CF6
    rect @x - 5, @y - 5, 10, 10
  end
end
