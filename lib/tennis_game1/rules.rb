module TennisGame1::Rules

  def lead_player
    [@player1, @player2].sort.first
  end

  def follower_player
    [@player1, @player2].sort.last
  end

  def players_are_in_tie?
    @player1 == @player2
  end

  def deuce?
    players_are_in_tie? and @player1.points >= 3
  end

  def has_player_in_advantage?
    (player_won?(@player1) or player_won?(@player2)) and not deuce?
  end

  def player_won?(player)
    player.points + 2 >= opponent_of(player).points and player.points >= 4
  end

  def opponent_of(player)
    [@player1, @player2].find { |p| p.name != player.name }
  end

end