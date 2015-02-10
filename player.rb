require_relative 'thing'

class Player < Thing
  def initialize(glyph, x, y)
    @inventory = []
    super
  end

  def pickup(item)
    @inventory << item
  end

  def drop(index)
    @inventory.delete_at(index)
  end

  def to_s
    @inventory.each_with_index.map {|item, i| "#{i}: #{item.to_s}" }.join("\n")
  end
end
