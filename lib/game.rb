require_relative './matrix_calculations.rb'
require_relative './matrix_transformations.rb'

module Flipping
  class Game
    attr_reader :matrix, :matrix_size, :max_possible_sum, :turn_nb

    def initialize(matrix)
      @matrix = matrix
      @matrix_size = matrix.size
      @max_possible_sum = MatrixCalculations.new(matrix).calculate_max_possible_sum
      @turn_nb = 1
    end

    def play
      puts "Let's go!"

      loop do
        print_matrix
        print_game_info

        puts "Your turn (rr/rc/h/q!):"
        value = $stdin.gets.chomp
        
        if value == 'h'
          print_help_notice
          next
        end
        
        if value == 'q!'
          puts "Exiting the game. Goodbye!"
          exit
        end

        cmd, index = value.strip.split(' ')
        index = index.to_i

        unless ['rr', 'rc'].include?(cmd)
          puts 'Invalid command!'
          next
        end

        begin
          if cmd == 'rr'
            puts "Reversing row nb #{index}"
            self.matrix = MatrixTransformations.reverse_row(matrix, index)
          else
            puts "Reversing col nb #{index}"
            self.matrix = MatrixTransformations.reverse_column(matrix, index)
          end
        rescue InvalidIndexError => e
          puts e.message
          next
        end

        run_winner_actions if win?

        @turn_nb += 1
      end
    end

    private

    attr_writer :matrix

    def current_sum
      MatrixCalculations.new(matrix).calculate_current_sum
    end

    def win?
      current_sum == max_possible_sum
    end

    def run_winner_actions
      puts ''
      puts 'Bravo! You WIN!'
      print_matrix('Resolved')
      puts ''
      puts 'Total game info:'
      print_game_info

      puts 'Do you want to play a new game?(y/n):'
      value = $stdin.gets.chomp
      if value == 'y'
        BuildMatrix.new.call.then { |m| Game.new(m).play }
      else
        puts "Exiting program. Goodbye!"
        exit
      end
    end

    def print_matrix(type_of_matrix = 'Current')
      puts ''
      puts "#{type_of_matrix} matrix is:"
      puts ''
      print ' ' * 5
      0.upto(matrix_size - 1) do |i|
        print "#{to_two_symbols_string(i)} "
      end
      puts ''

      print ' ' * 4
      print '-' * matrix_size * 3

      puts ''
      matrix.each_with_index do |i, i_index|
        i.each_with_index do |j, j_index|
          if j_index == 0
            print "#{to_two_symbols_string(i_index)} | "
          end
    
          print to_two_symbols_string(j)
          print ' '
        end
        puts ''
      end
    end

    def print_game_info
      puts ''
      game_info =  "|| Turn Number: #{turn_nb} | Current Sum: #{current_sum} | Max Possible Sum: #{max_possible_sum} ||"
        
      puts "=" * game_info.size
      puts game_info
      puts "=" * game_info.size
      puts "-" * game_info.size
      puts ''
    end

    def to_two_symbols_string(i)
      ii = i.to_s
      ii.size == 1 ? "#{ii} " : ii
    end

    def print_help_notice
      puts "Allowed commands:"
      puts "- 'rr <number>' - Reverse Row: Flips the specified row horizontally. Replace '<number>' with the index of the row you want to reverse (e.g., 'rr 0' for the first row)."
      puts "- 'rc <number>' - Reverse Column: Flips the specified column vertically. Replace '<number>' with the index of the column you want to reverse (e.g., 'rc 1' for the second column)."
      puts "- 'h' - Help: Displays a list of commands or shows the game rules again."
      puts "- 'q!' - Quit Game: Exits the game immediately. You can also use 'Ctrl + C' to quit."
      puts ""
    end
  end
end