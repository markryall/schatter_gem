module Schatter::Index
  LETTERS = %w{a b c d e f g h i j}

  def to_index number
    number.to_s.scan(/./).map{|c| LETTERS[c.to_i]}.join('')
  end

  def from_index string
    string.scan(/./).map{|c| LETTERS.index c}.join.to_i
  end
end