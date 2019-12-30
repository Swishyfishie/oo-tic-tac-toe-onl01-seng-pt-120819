class TicTacToe 
  
  def initialize
    @board = Array.new(9, ' ')
  end 

  WIN_COMBINATIONS = [
    [0, 1, 2],  
    [3, 4, 5],  
    [6, 7, 8],  
    [0, 3, 6],  
    [1, 4, 7],  
    [2, 5, 8],
    [6, 4, 2],
    [0, 4, 8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
      user_input = Integer(input) - 1 
  end
  
  def move(i, token="X") 
    @board[i] = token
  end 
  
  def position_taken?(index)
    if @board[index] == ' '
      return false 
    else 
      return true 
    end
  end 
  
  def valid_move?(position)
    if !position_taken?(position) && position.between?(0,8)
      return true
    else 
      return false 
    end 
  end 
  
  def turn_count 
    counter = @board.reject { |e| e.empty? || e == ' ' }
    p counter.length
  end 
  
  def current_player 
    if turn_count % 2 == 0  
      token = "X"
    else 
      token = "O"
    end
  end 
  
  def turn 
    puts "Pick a position from 1 to 9: "
    user_i = gets 
    user_i = input_to_index(user_i)
    if valid_move?(user_i)
      move(user_i, current_player)
      display_board
    end
    turn 
  end 
  
  def won? 
    if !WIN_COMBINATIONS 
      false 
    else 
      display_board
    end
  end 
  
  
  
end 