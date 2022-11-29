# frozen_string_literal: true

require_relative 'game'

def create_new_game
  new_game = Game.new
  new_game.start_game
  repeat_game
end

def repeat_game
  puts 'Do you want to play again? Y/N'

  answer = gets.strip.downcase
  %w[yes y].include?(answer) ? create_new_game : exit
end

create_new_game
