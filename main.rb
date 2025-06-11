require './lib/game.rb'
require './lib/build_matrix.rb'

class Main
  class << self
    def start_process
      puts ''
      puts "Hi, Welcome in the Flipping game!"
      puts ''
      
      start_menu
    end

    def print_rules
      puts ''
      puts 'Game Title: Flipping Matrix'
      puts ''
      puts 'Objective: Achieve the highest possible sum of integers within the upper-left N x N quadrant of a given 2N x 2N matrix.'
      puts ''
      puts 'Gameplay: You are allowed to reverse any row or column (horizontally or vertically) as many times as you wish.'
      puts
    end
    
    def start_menu
      puts "- To play a game, press 'p'"
      puts "- If you want to read rules, press 'h'"
      puts "- To exit press 'q!' or Ctrl + C"
      puts ""
      puts 'Your choise (p/h/q!):'
      value = $stdin.gets.chomp
    
      case value
      when 'h'
        print_rules
        start_menu
      when 'p'
        puts "Let's Go!"
        Flipping::BuildMatrix.new.call.then { |m| Flipping::Game.new(m).play }
      when 'q!'
        puts 'Exiting the game. Goodbye!'
        exit
      else
        puts "Command not recognized."
        start_menu
      end
    rescue Interrupt
      puts 'Exiting the game. Goodbye!'
      exit
    end
  end
end

Main.start_process
