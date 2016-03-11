class TennisGame1

  require_relative 'tennis_game1/player'
  require_relative 'tennis_game1/rules'

  include Rules

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

  PLAYER_POINT_MEANING = {
      0 => "Love",
      1 => "Fifteen",
      2 => "Thirty",
      3 => "Forty",
  }

  def current_score_message
    s = PLAYER_POINT_MEANING[@player1.points]
    players_are_in_tie? ? s + "-All" : s + "-" + PLAYER_POINT_MEANING[@player2.points]
  end

end