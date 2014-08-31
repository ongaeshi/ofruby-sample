def setup
  set_background 239, 90, 41
  @frame = 0
  @x = 0
  @y = -100
  #@night = true
end

def update
  @frame += 1
  @night = true if @frame > 950
  @x += 0.6
  @y  += 0.6
  set_background 0, 0, 0 if @night
end

def draw
  if @night
    set_color 255, 255, 255
    star 100, 100
    star 49, 24
    star 123, 42
    star 300, 200
    star 50, 150
    star 300, 50
  else
    c 100, @y
  end
  set_color 45, 150, 50
  m 0, 480, 150, 70
  m 100, 480, 200, 150
  m 200, 480, 200, 50
  # set_color 0, 0, 0
  # text "#{@frame}", 0, 100
end

def m(x, y, w, h, rate = 0.5)
  triangle x, y, x + w, y, x + w*rate, y - h
end

def c(x, y)
  set_color 240, 30, 30
  circle x, y, 50
end

def star x, y
  circle x, y, 1
  circle x+100, y+55, 1
  circle x+80, y+10, 1
end
