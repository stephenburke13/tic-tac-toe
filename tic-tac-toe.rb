class Player
	attr_accessor :name, :letter
	def initialize(array)
		@name = array[0]
		@letter = array[1]
		@num = array[2]
	end

	def turn
		puts "Your move, #{@name}"
		move = gets.chomp
		result = move.split(',')
		row = result[0].to_i
		column = result[1].to_i
		result = [row,column]
		return result, @letter
	end
end

class Square
end

class Board
	attr_accessor :squares
	def initialize
		@squares = [[" "," "," "],[" "," "," "],[" "," "," "]]
	end
	
	def move(turn_result)
		@squares[turn_result[0][0]][turn_result[0][1]] = turn_result[1]
		show_board
	end

	def show_board
		puts "
			Game Board: \n
			[#{@squares[0][0]}][#{@squares[0][1]}][#{@squares[0][2]}]\n
			[#{@squares[1][0]}][#{@squares[1][1]}][#{@squares[1][2]}]\n
			[#{@squares[2][0]}][#{@squares[2][1]}][#{@squares[2][2]}]\n"
	end

end

def new_player(num)
	puts "Player #{num}, what is your name?"
	player_name = gets.chomp
	puts "Player #{num}, what letter will you play as?"
	player_letter = gets.chomp
	puts "Thank you #{player_name}!"
	return player_name, player_letter, num
end

# player_1 = Player.new(new_player(1))
# player_2 = Player.new(new_player(2))

def turn_loop(player)
	turn_result = player.turn
	unless game_board.squares[turn_result[0][0]][turn_result[0][1]] == " "
		puts "Error! That square is already taken."
		turn_loop(player)
	end
	turn_result
end

def game_loop
	loop do
		game_board.move(turn_loop(player_1))
		game_board.move(turn_loop(player_2))
	end	
end

player_1 = Player.new(["Stephen", "X"])
player_2 = Player.new(["Abby", "O"])

game_board = Board.new
game_board.show_board
game_loop





