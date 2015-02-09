class Thing
  attr_reader :glyph
  attr_accessor :x, :y

  def initialize(glyph, x, y)
    @glyph, @x, @y = glyph, x, y
  end

  def at?(x, y)
    @x == x && @y == y
  end
end