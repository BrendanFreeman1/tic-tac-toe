# frozen_string_literal: true

# <summery>Represents a player for the game<summery>
# <param name="id">Identifier for this class instance<param>
# <param name="marker">The Marker placed on the game board for this class instance<param>
class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

# <summery>Represents an instance if the game<summery>
class TicTacToe
  WIN_STATES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7], [1, 4, 7], [2, 5, 8], [3, 6, 9]].freeze

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @game_over = false
    @tie = false
    @player_one = Player.new('Player 1', 'X')
    @player_two = Player.new('Player 2', 'O')
    @current_player = 2
  end

  def start_game
    puts "#{@player_one.name} marker is - #{@player_one.marker}"
    puts "#{@player_two.name} marker is - #{@player_two.marker}"

    until @game_over

      display_board

      @current_player = swap_current_player

      update_array(next_marker_location)

      @game_over = check_win_state

    end

    display_board
    end_game
  end

  private

  def end_game
    if @tie
      puts 'The Game is a tie'
    else
      puts "#{@current_player.name} is the winner"
    end

    puts 'Do you want to play again? Y/N'

    answer = gets.strip.downcase
    %w[yes y].include?(answer) ? create_new_game : exit
  end

  def update_array(next_marker_location)
    @board[next_marker_location - 1] = @current_player.marker
  end

  def next_marker_location
    puts "#{@current_player.name} please enter the location you would like to place your marker:"
    correct_input = false

    until correct_input
      player_choice = gets.strip.to_i

      correct_input = check_player_input(player_choice)
    end

    player_choice.to_i
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

  def swap_current_player
    @current_player == @player_one ? @player_two : @player_one
  end

  def check_win_state
    WIN_STATES.any? do |sequence|
      return true if sequence.all? { |position| @board[position - 1] == @current_player.marker }
    end

    if @board.all? { |e| e.is_a?(String) }
      @tie = true
      return true
    end

    false
  end

  def display_board
    puts "\n | #{@board[0]} | #{@board[1]} | #{@board[2]} | "
    puts ' −−−−+−−−+−−−−'
    puts " | #{@board[3]} | #{@board[4]} | #{@board[5]} | "
    puts ' −−−−+−−−+−−−−'
    puts " | #{@board[6]} | #{@board[7]} | #{@board[8]} |\n\n"
  end
end

def create_new_game
  new_game = TicTacToe.new
  new_game.start_game
end

create_new_game
