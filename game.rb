# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# <summery>Represents an instance if the game<summery>
class Game
  attr_accessor :tie

  def initialize
    @board = Board.new(self)
    @game_over = false
    @tie = false
    @player_one = Player.new('Player 1', 'X')
    @player_two = Player.new('Player 2', 'O')
    @current_player = 2
  end

  def start_game
    intro_text

    until @game_over

      @board.display_board

      @current_player = Player.swap_current_player(@current_player, @player_one, @player_two)

      @board.update_board(next_marker_location, @current_player)

      @game_over = @board.check_win_state(@current_player)

    end

    @board.display_board
    end_game
  end

  private

  def intro_text
    puts "#{@player_one.name} marker is - #{@player_one.marker}"
    puts "#{@player_two.name} marker is - #{@player_two.marker}"
  end

  def end_game
    if tie
      puts 'The Game is a tie'
    else
      puts "#{@current_player.name} is the winner"
    end
  end

  def next_marker_location
    puts "#{@current_player.name} please enter the location you would like to place your marker:"
    correct_input = false

    until correct_input
      player_choice = gets.strip.to_i

      correct_input = @board.check_player_input(player_choice)
    end

    player_choice.to_i
  end
end
