require_relative 'player'
require_relative 'arena'
require_relative 'item'

class Game
  def initialize
    @player = Player.new('@', 10, 10)
    @arena = Arena.new(20, 20, @player, [Item.new('/', 'sword', 11, 11), Item.new('!', 'potion', 5, 5)])
  end

  def play!
    msg = ""
    loop do
      reset_screen!
      puts msg
      msg = ""
      puts @arena
      puts @player
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
      when 'g'
        item = @arena.item_at(@player.x, @player.y)
        if item
          @player.pickup(item)
          @arena.lose_item(item)
          msg = "I found something!"
        else
          msg = 'Nothing to pick up'
        end
      when 'd'
        puts "Please enter the number of the item to drop:"
        index = STDIN.gets.chomp.to_i

        if item = @player.drop(index)
          @arena.add_item(item, @player.x, @player.y)
        else
          msg = "You don't have that item!"
        end
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
