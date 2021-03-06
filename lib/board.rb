class Board
  attr_accessor :cells

  MOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    @cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    !taken?(input) && MOVES.include?(input)
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

  def open_positions
    MOVES.select do |move|
      !taken?(move)
    end
  end

  def current_token
    turn_count % 2 == 0 ? "X" : "O"
  end
end