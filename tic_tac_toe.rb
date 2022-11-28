# frozen_string_literal: true

def start_game
  game_over = false
  game_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  current_player = 2

  puts ''
  puts 'Player 1 marker is - X'
  puts 'Player 2 marker is - O'

  until game_over

    # Show players the board
    display_board(game_array)

    # Swap from previous playerr
    current_player = get_current_player(current_player)

    # Get marker location from player
    next_marker_location = get_player_input(current_player, game_array)

    # Add players selection to the game_array
    update_array(game_array, current_player, next_marker_location)

    # Check if anyone has won
    game_over = check_win_state(game_array)
  end

  display_board(game_array)
  end_game(current_player)
end

def end_game(current_player)
  puts "Player #{current_player} is the winner!"
  puts 'Do you want to play again? Y/N'

  answer = gets.strip.downcase
  if %w[yes y].include?(answer)
    start_game
  else
    exit
  end
end

def update_array(game_array, current_player, next_marker_location)
  marker = current_player == 1 ? 'X' : 'O'

  game_array[next_marker_location - 1] = marker
end

def get_player_input(current_player, game_array)
  puts "Player #{current_player} please enter the location you would like to place your marker."
  correct_input = false

  until correct_input
    player_choice = gets.strip

    if player_choice.length > 1 || player_choice.to_i.zero?
      puts 'Invalid input, input a number between 1 and 9'
    elsif game_array.include?(player_choice.to_i)
      correct_input = true
    else
      puts 'Invalid input, that position is already taken'
    end
  end

  player_choice.to_i
end

def get_current_player(current_player)
  current_player == 1 ? 2 : 1
end

def check_win_state(game_array)
  if game_array[0] == game_array[1] && game_array[0] == game_array[2]
    true
  elsif game_array[3] == game_array[4] && game_array[3] == game_array[5]
    true
  elsif game_array[6] == game_array[7] && game_array[6] == game_array[8]
    true
  elsif game_array[0] == game_array[3] && game_array[0] == game_array[6]
    true
  elsif game_array[1] == game_array[4] && game_array[1] == game_array[7]
    true
  elsif game_array[2] == game_array[5] && game_array[2] == game_array[8]
    true
  elsif game_array[0] == game_array[4] && game_array[0] == game_array[8]
    true
  elsif game_array[2] == game_array[4] && game_array[2] == game_array[6]
    true
  else
    false
  end
end

def display_board(game_array)
  puts ''
  puts " | #{game_array[0]} | #{game_array[1]} | #{game_array[2]} | "
  puts ' −−−−+−−−+−−−−'
  puts " | #{game_array[3]} | #{game_array[4]} | #{game_array[5]} | "
  puts ' −−−−+−−−+−−−−'
  puts " | #{game_array[6]} | #{game_array[7]} | #{game_array[8]} | "
  puts ''
end

start_game