class TicTacToe

  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  # removed board as an argument #
  def move(index, player)
    @board[index] = player
  end

  # removed board as an argument #
  def position_taken?(index)
    @board[index] == 'X' || @board[index] == 'O'
  end

  # removed board as an argument #
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  # removed board as an argument #
  def turn
    puts 'Please enter 1-9:'
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  # removed board as an argument #
  def turn_count
    @board.count { |token| token == 'X' || token == 'O' }
  end

  # removed board as an argument #
  def current_player
    turn_count.even? ? 'X' : 'O'
  end

# removed board as an argument #
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  # removed board as an argument #
  def full?
    @board.all? { |token| token == 'X' || token == 'O' }
  end

  # removed board as an argument #
  def draw?
    !won? && full?
  end

  # removed board as an argument #
  def over?
    won? || draw?
  end

  # removed board as an argument #
  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end

  # removed board as an argument #
  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
