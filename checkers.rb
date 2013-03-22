
class Checkers
  attr_accessor :board
  
  def initialize
    @board = Board.new
  end

  def board
    @board
  end

  def play
  end

end

class Board
  attr_accessor :rows

  def initialize
    @rows = empty_board
    set_up_pieces
  end

  def [](coord)
    @rows[coord[0]][coord[1]]
  end

  def []=(coord, value)
    @rows[coord] = value
  end

  def empty_board
    Array.new(8) { Array.new(8) }
  end

  def set_up_pieces
    @rows[0] = [nil, Piece, nil, Piece, nil, Piece, nil, Piece]
    @rows[1] = [Piece, nil, Piece, nil, Piece, nil, Piece, nil]
    @rows[2] = [nil, Piece, nil, Piece, nil, Piece, nil, Piece]

    @rows[5] = [Piece, nil, Piece, nil, Piece, nil, Piece, nil]
    @rows[6] = [nil, Piece, nil, Piece, nil, Piece, nil, Piece]
    @rows[7] = [Piece, nil, Piece, nil, Piece, nil, Piece, nil]
  end

  def print
    @rows.each do |row|
      p row
    end

    nil
  end

end

class Piece

end

class King < Piece

end

class Player

end

class HumanPlayer < Player

end

class ComputerPlayer < Player

end