# frozen_string_literal: true

require_relative 'player'
require_relative 'game'

# <summery>Represents an instance if the game board<summery>
class Board
  WIN_STATES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7], [1, 4, 7], [2, 5, 8], [3, 6, 9]].freeze

  def initialize(game)
    @game = game
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def update_board(next_marker_location, current_player)
    @board[next_marker_location - 1] = current_player.marker
  end

  def display_board
    puts "\n | #{@board[0]} | #{@board[1]} | #{@board[2]} | "
    puts ' −−−−+−−−+−−−−'
    puts " | #{@board[3]} | #{@board[4]} | #{@board[5]} | "
    puts ' −−−−+−−−+−−−−'
    puts " | #{@board[6]} | #{@board[7]} | #{@board[8]} |\n\n"
  end

  def check_win_state(current_player)
    WIN_STATES.any? do |sequence|
      return true if sequence.all? { |position| @board[position - 1] == current_player.marker }
    end

    if @board.all? { |e| e.is_a?(String) }
      @game.tie = true
      return true
    end

    false
  end

  def check_player_input(player_choice)
    if player_choice.to_s.length > 1 || player_choice.zero?
      puts 'Invalid input, input a number between 1 and 9'
    elsif @board.include?(player_choice)
      return true
    else
      puts 'Invalid input, that position is already taken'
    end

    false
  end
end
