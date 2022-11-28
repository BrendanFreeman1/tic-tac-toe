def StartGame()
  game_over = false
  game_array = [1,2,3,4,5,6,7,8,9]
  current_player = 2

  puts ""
  puts "Player 1 marker is - X"
  puts "Player 2 marker is - O"


  while !game_over

    #Show players the board
    DisplayBoard(game_array)

    #Swap from previous playerr
    current_player = GetCurrentPlayer(current_player)

    #Get marker location from player
    next_marker_location = GetPlayerInput(current_player, game_array)

    #Add players selection to the game_array
    UpdateArray(game_array, current_player, next_marker_location)

    #Check if anyone has won
    game_over = CheckWinState(game_array)
  end

  DisplayBoard(game_array)
  EndGame(current_player)
end

def EndGame(current_player)
  puts "Player #{current_player} is the winner!"
  puts "Do you want to play again? Y/N"

  answer = gets.strip.downcase()
  if(answer == "yes" || answer == "y")
    StartGame()
  else
    exit
  end
end

def UpdateArray(game_array, current_player, next_marker_location)
  current_player == 1 ? marker = "X" : marker = "O"

  game_array[next_marker_location - 1] = marker

end

def GetPlayerInput(current_player, game_array)
  puts "Player #{current_player.to_s} please enter the location you would like to place your marker."
  correct_input = false

  while !correct_input
    player_choice = gets.strip

    if player_choice.length > 1 || player_choice.to_i == 0
      puts "Invalid input, input a number between 1 and 9"
    else
      if game_array.include?(player_choice.to_i) 
        correct_input = true 
      else
        puts 'Invalid input, that position is already taken'
      end
    end
  end

  player_choice.to_i
end

def GetCurrentPlayer(current_player)
  current_player == 1 ? current_player = 2 : current_player = 1

  current_player
end

def CheckWinState(game_array)
  case 
  when game_array[0] == game_array[1] && game_array[0] == game_array[2]
    return true    
  when game_array[3] == game_array[4] && game_array[3] == game_array[5]
    return true
  when game_array[6] == game_array[7] && game_array[6] == game_array[8]
    return true
  when game_array[0] == game_array[3] && game_array[0] == game_array[6]
    return true
  when game_array[1] == game_array[4] && game_array[1] == game_array[7]
    return true
  when game_array[2] == game_array[5] && game_array[2] == game_array[8]
    return true
  when game_array[0] == game_array[4] && game_array[0] == game_array[8]
    return true
  when game_array[2] == game_array[4] && game_array[2] == game_array[6]
    return true
  else
    return false 
  end
end

def DisplayBoard(game_array)
  puts ""
  puts " | #{game_array[0]} | #{game_array[1]} | #{game_array[2]} | "
  puts " −−−−+−−−+−−−−"
  puts " | #{game_array[3]} | #{game_array[4]} | #{game_array[5]} | "
  puts " −−−−+−−−+−−−−"
  puts " | #{game_array[6]} | #{game_array[7]} | #{game_array[8]} | "
  puts ""
end

StartGame()