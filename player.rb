require_relative 'thing'

class Player < Thing
  def initialize(glyph, x, y)
    @inventory = []
    super
  end

  def pickup(item)
    @inventory << item
  end

  def to_s
    @inventory.map {|i| i.to_s}.join("\n")
  end
end