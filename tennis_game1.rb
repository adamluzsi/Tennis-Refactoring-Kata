class TennisGame1

  require_relative 'tennis_game1/player'

  PLAYER_POINT_MEANING = {
      0 => "Love",
      1 => "Fifteen",
      2 => "Thirty",
      3 => "Forty",
  }

  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
  end

  def won_point(player_name)
    player = player_name == @player1.name ? @player1 : @player2
    player.won_point!
  end

  def score
    if deuce?
      "Deuce"

    elsif has_player_in_advantage?

      if lead_player.only_have_advantage?(follower_player)
        "Advantage " + lead_player.name

      else
        "Win for " + lead_player.name

      end

    else
      current_score_message

    end
  end




  protected

  def lead_player
    [@player1, @player2].sort.first
  end

  def follower_player
    [@player1, @player2].sort.last
  end

  def players_are_in_tie?
    @player1 == @player2
  end

  def current_score_message
    s = PLAYER_POINT_MEANING[@player1.points]
    players_are_in_tie? ? s + "-All" : s + "-" + PLAYER_POINT_MEANING[@player2.points]
  end

  def deuce?
    players_are_in_tie? and @player1.points >= 3
  end

  def has_player_in_advantage?
    (player_won?(@player1) or player_won?(@player2)) and not deuce?
  end

  def player_won?(player)
    player.points + 2 >= [@player1, @player2].find { |p| p.name != player.name }.points and player.points >= 4
  end

end