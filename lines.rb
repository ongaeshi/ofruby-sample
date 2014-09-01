def draw
  0.step 99 do |i|
    r = i / 100 * 255
    set_color r, 0, 0, 128
    line 0, 0, i * 20, 480
  end
end
