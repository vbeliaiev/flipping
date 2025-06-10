class Flipping
  attr_reader :matrix_size, :matrix_size, :max_possible_sum
  attr_accessor :turn_nb, :matrix
 
  MAX_MATRIX_SIZE = 50

  def initialize
    loop do
      puts "Enter the matrix size. It must be a positive, even number, up to #{MAX_MATRIX_SIZE}."
      value = $stdin.gets.chomp.to_i
     
      if value > 1 && value <= MAX_MATRIX_SIZE && value.even?
        @matrix_size = value
        initialize_matrix
        until calculate_max_possible_sum != calculate_current_sum do
          initialize_matrix
        end
        @turn_nb = 1
        @max_possible_sum = calculate_max_possible_sum
        break
      else
        puts "Invalid value."
      end
    end
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

      if cmd == 'rr'
        puts "Reversing row nb #{index}"
        reverse_row(index)

      else
        puts "Reversing col nb #{index}"
        reverse_column(index)
      end

      if calculate_current_sum == max_possible_sum
        puts ''
        puts 'Bravo! You WIN!'
        puts ''
        puts 'Total game info:'
        print_game_info

        puts 'Do you want to play a new game?(y/n):'
        value = $stdin.gets.chomp
        if value == 'y'
          Flipping.new.play
        else
          puts "Exiting program. Goodbye!"
          exit
        end
      end

      self.turn_nb += 1
    end
  end

  def reverse_column(col_nb)
    initial_col = matrix.map { |row| row[col_nb] }
    ordered_col = initial_col.reverse
    matrix.each_with_index do |row, index|
        row[col_nb] = ordered_col[index]
    end
  end
  
  def reverse_row(row_nb)
    self.matrix[row_nb] = matrix[row_nb].reverse
    matrix
  end

  def calculate_current_sum
    total_sum = 0
  
    0.upto(matrix_size / 2 - 1) do |i|
      0.upto(matrix_size / 2 - 1) do |j|
        total_sum += matrix[i][j]
      end
    end

    total_sum
  end

  def calculate_max_possible_sum
    total_sum = 0
    0.upto(matrix_size / 2 - 1) do |i|
      0.upto(matrix_size / 2 - 1) do |j|
        total_sum += possible_values(i, j).max
      end
    end
    
    total_sum
  end

  private

  def possible_values(i, j)
    max_index = matrix_size - 1
    
    a = matrix[i][j]
    b = matrix[i][max_index - j]
    c = matrix[max_index - i][j]
    d = matrix[max_index - i][max_index - j]
    
    [a, b, c, d]
  end

  def initialize_matrix
    @matrix = Array.new(matrix_size) { Array.new(matrix_size) }

    0.upto(matrix_size - 1) do |i|
      0.upto(matrix_size - 1) do |j|
        @matrix[i][j] = rand(100)
      end
    end
  end

  def print_matrix
    puts ''
    puts "The current matrix is:"
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
    game_info =  "|| Turn Number: #{turn_nb} | Current Sum: #{calculate_current_sum} | Max Possible Sum: #{max_possible_sum} ||"
      
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
    puts "- 'q!' - Quit Game: Exits the game immediately. You can also use 'Ctrl + C' to quit."
    puts "- 'h' - Help: Displays a list of commands or shows the game rules again."
    puts ""
  end
end