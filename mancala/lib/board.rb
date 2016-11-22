class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    @player_cups = { name1 => 6, name2 => 13 }
    @players = [name1,name2]
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |i|
      4.times { @cups[i] << :stone } unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    if start_pos < 1 || start_pos > 12
      raise 'Invalid starting cup'
    end
  end

  def make_move(start_pos, current_player_name)
    pos = start_pos
    stones = @cups[start_pos]
    @cups[start_pos] = []

    until stones.empty?
      pos += 1
      pos = 0 if pos == 14
      # Makes sure current position is not the opponent's cup
      opponent_name = (@players - [current_player_name])[0]
      unless pos == @player_cups[opponent_name]
        @cups[pos] << stones.pop
      end
    end
    render
    next_turn(pos, current_player_name)
  end

  def next_turn(ending_cup_idx,current_player_name)
    if ending_cup_idx == @player_cups[current_player_name]
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
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
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    case @cups[6] <=> @cups[13]
    when -1
      @players[1]
    when 0
      :draw
    when 1
      @players[0]
    end
  end
end
