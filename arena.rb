require 'pry'

class Arena
  def initialize(width, height, player, things)
    @height, @width = height, width
    @player = player
    @things = things
  end

  def item_at(x, y)
    @things.select {|t| t.at?(x, y)}.first
  end

  def lose_item(item)
    @things.delete(item)
  end

  def to_s
    (0..@height).map do |y|
      (0..@width).map do |x|
        if @player.at?(x, y)
          @player.glyph
        elsif item_at(x, y)
          item_at(x, y).glyph
        elsif x == 0 || x == @width || y == 0 || y == @height
          '#'
        else
          '.'
        end
      end.join('')
    end.join("\n")
  end
end

