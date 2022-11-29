# frozen_string_literal: true

# <summery>Represents a player for the game<summery>
# <param name="name">Identifier for this class instance<param>
# <param name="marker">The Marker placed on the game board for this class instance<param>
class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def self.swap_current_player(current_player, player_one, player_two)
    current_player == player_one ? player_two : player_one
  end
end
