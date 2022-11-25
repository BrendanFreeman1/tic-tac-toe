def BuildBoard(game_array = [1,2,3,4,5,6,7,8,9])
  puts ""
  puts " | #{game_array[0]} | #{game_array[1]} | #{game_array[2]} | "
  puts " −−−−+−−−+−−−−"
  puts " | #{game_array[3]} | #{game_array[4]} | #{game_array[5]} | "
  puts " −−−−+−−−+−−−−"
  puts " | #{game_array[6]} | #{game_array[7]} | #{game_array[8]} | "
  puts ""
end

BuildBoard()