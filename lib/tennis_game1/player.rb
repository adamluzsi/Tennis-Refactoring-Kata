class TennisGame1::Player

  attr_reader :name

  def initialize(name)
    @name = name
    @points = 0
  end

  def points
    @points
  end

  def won_point!
    @points += 1
  end

  def <=>(oth_player)
    oth_player.points <=> @points
  end

  def ==(oth_player)
    points == oth_player.points
  end

  def only_have_advantage?(oth_player)
    points == oth_player.points + 1
  end

end