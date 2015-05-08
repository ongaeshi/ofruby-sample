# sprite.rb

CX = width / 2
CY = height / 2
GY = height - 50

def setup
  set_background_hex 0xcbe0f5

  @pig = Sprite.new(CX + 50, CY, Image.emoji(:pig2))
  @pig.set_anchor_center
  @pig.sx = @pig.sy = 3

  @bicyclist = Sprite.new(50, GY, Image.emoji(:bicyclist))
  @bicyclist.set_anchor_bottom
  @bicyclist.mirror(false, true)
  @bicyclist.vx = 2

  @palm_tree = Image.emoji(:palm_tree)
  @palm_tree.set_anchor_percent(0.5, 1.0)
  @palm_tree.resize(@palm_tree.width, 70)
end

def update
  @pig.rotate -= 5
  @bicyclist.update
  @bicyclist.x = 0 if @bicyclist.x > width
end

def draw
  set_color_hex 0x7ace32
  rect 0, GY, width, height

  @pig.draw

  set_color_hex 0xffffff
  0.step(width, 40) do |x|
    @palm_tree.draw(x, GY)
  end

  @bicyclist.draw
end

#---------------------------------------------------------------

class Sprite
  attr_accessor :x, :y, :rotate, :sx, :sy
  attr_accessor :vx, :vy

  def initialize(x, y, image)
    @x = x
    @y = y
    @image = image
    @rotate = 0
    @sx = 1
    @sy = 1
    @vx = @vy = 0
  end

  def mirror(x, y)
    @image.mirror(x, y)
  end

  def set_anchor_center
    @image.set_anchor_percent(0.5, 0.5)
  end

  def set_anchor_bottom
    @image.set_anchor_percent(0.5, 1.0)
  end

  def update
    @x += @vx
    @y += @vy
  end

  def draw
    push_matrix do
      translate @x, @y
      Kernel.rotate @rotate
      scale @sx, @sy

      set_color_hex 0xffffff
      @image.draw(0, 0)
    end
  end
end

