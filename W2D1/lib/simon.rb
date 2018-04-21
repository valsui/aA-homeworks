class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
     take_turn
    end
    if game_over == true
      game_over_message
      reset_game
    end
  end

  def take_turn
    # until game_over
      show_sequence
      require_sequence
      @sequence_length += 1
      round_success_message if game_over == false
    # end
  end

  def correct_seq?(guess)
    guess == @seq
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    @seq.each_with_index do |c, idx|
      puts "Enter sequence at index: #{idx}"
      guess = gets.chomp
      return game_over = true if c != guess
    end
  end

  def add_random_color
    seq.push(COLORS.sample)
  end

  def round_success_message
    puts "Nice"
  end

  def game_over_message
    puts "Game over"
  end

  def reset_game
    @seq = []
    @game_over = false
    @sequence_length = 1
  end
end
