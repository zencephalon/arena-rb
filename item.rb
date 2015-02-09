require_relative 'thing'

class Item < Thing
  def initialize(glyph, name, x, y)
    @name = name
    super(glyph, x, y)
  end

  def to_s
    "#{@glyph}: #{@name}"
  end
end