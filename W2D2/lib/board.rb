
class Board
  attr_accessor :cups
  CUPS_POS = [0, 1, 2, 3, 4, 5, 6 ,7 ,8, 9, 10, 11, 12, 13]
  def initialize(name1, name2)
    @player1, @player2 = name1, name2
    @cups = Array.new(14) {Array.new(4,:stone)}
    @cups[6], @cups[13] = [], []
  end

  # def place_stones
  #   # helper method to #initialize every non-store cup with four stones each
  # end

  def valid_move?(start_pos)
    valid = start_pos.between?(1,12)
    raise "Invalid starting cup" if !valid
    valid
  end

  #board
  #[0 1 2 3 4 5  6  7 8  9 10 11 12  13]
  #[1 2 3 4 5 6 pot 8 9 10 11 12 13 pot]
  def make_move(start_pos, current_player_name)
    pots_pos = [6, 13]
    pot = 6 if current_player_name == @player1
    pot = 13 if current_player_name == @player2
    num_stones = @cups[start_pos].length
    @cups[start_pos] = []
    if !pots_pos.include?(pots_pos)
      stop = do_round(num_stones, start_pos, current_player_name)
      p "stopped at: #{stop} with #{@cups[stop].length} stones"
      render
      next_turn(stop, pot)
    end
  end

  def do_round(length, start_pos, current_player)
    i = start_pos + 1
    until length == 0
      if current_player == @player1
        if i != 13
          @cups[i] << :stone
          length -= 1
        end
      else
        if i != 6
          @cups[i] << :stone
          length -= 1
        end
      end
      i = (i+1)%14
    end
    return (i-1)%14
  end

  def next_turn(ending_cup_idx, pot)
    # helper method to determine what #make_move returns
    pots_pos = [6, 13]
    if @cups[ending_cup_idx].length == 1 && !pots_pos.include?(ending_cup_idx)
      :switch
    elsif ending_cup_idx == pot
      :prompt
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1 = (0..5).all? {|x| @cups[x].empty?}
    side2 = (7..12).all? {|x| @cups[x].empty?}

    return side1 || side2 ? true : false
  end

  def winner
    case @cups[13] <=> @cups[6]
    when -1
      @player1
    when 0
      :draw
    when 1
      @player2
    end
  end
end
