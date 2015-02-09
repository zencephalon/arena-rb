class Player
  attr_reader :glyph
  attr_accessor :x, :y

  def initialize(glyph, x, y)
    @glyph, @x, @y = glyph, x, y
  end

  def at?(x, y)
    @x == x && @y == y
  end
end

class Arena
  def initialize(width, height, player)
    @height, @width = height, width
    @player = player
  end

  def to_s
    (0..@height).map do |y|
      (0..@width).map do |x|
        case true
        when @player.at?(x, y)
          @player.glyph
        when x == 0 || x == @width || y == 0 || y == @height
          '#'
        else
          '.'
        end
      end.join('')
    end.join("\n")
  end
end

class Game
  def initialize
    @player = Player.new('@', 10, 10)
    @arena = Arena.new(20, 20, @player)
  end

  def play!
    loop do
      reset_screen!
      puts @arena
      c = get_char
      
      case c
      when 'l'
        @player.x += 1
      when 'h'
        @player.x -= 1
      when 'j'
        @player.y += 1
      when 'k'
        @player.y -= 1
      end
    end
  end

  def clear_screen!
    print "\e[2J"
  end

  def move_to_home!
    print "\e[H"
  end

  def reset_screen!
    clear_screen!
    move_to_home!
  end

  def get_char
    state = `stty -g`
    `stty raw -echo -icanon isig`

    STDIN.getc.chr
  ensure
    `stty #{state}`
  end
end

g = Game.new
g.play!