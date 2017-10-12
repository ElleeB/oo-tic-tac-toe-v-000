class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new([" ", " ", " ", " ", " ", " ", " ", " ", " "])
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    @user_input = user_input
    @index = @user_input.to_i - 1
  end

  def move(index, char)
    @index = index
    @char = char
    @board[@index] = @char
  end

  def position_taken?(index)
    @index = index
    if @board[@index] == "" || @board[@index] == " " || @board[@index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    @index = index
    if position_taken?(index) == false && @index.between?(0, 8)
      true
    else
      false
    end
  end

  def turn_count
    counter = 0
    @board.each do |cell_value|
      if cell_value == 'X' || cell_value == 'O'
        counter += 1
        puts "Turn number #{counter}"
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return 'X'
    else
      return 'O'
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    @index = input_to_index(user_input)
    if valid_move?(@index) == true #&& position_taken?(@index) == false
      #move(@index, @char)
      display_board
    elsif valid_move?(@index) == false || position_taken?(@index) == true
      puts "Please enter a valid number, or the number for an unoccupied space"
      turn(user_input)
    end
  end

end
